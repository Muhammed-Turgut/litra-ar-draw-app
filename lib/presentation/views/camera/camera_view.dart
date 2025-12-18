import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';
import 'package:litra_ar_draw_app/presentation/enums/camera_permission_status.dart';
import 'package:litra_ar_draw_app/presentation/view_models/camera_view_model.dart';
import 'package:provider/provider.dart';

class CameraView extends StatefulWidget {
  final CategoryEntity categoryEntity;
  CameraView({required this.categoryEntity});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  Offset position = const Offset(100, 200);
  double scale = 1.0;
  double previousScale = 1.0;
  int selectedItem = 1;
  double currentOpacity = 1.0; // Başlangıç değeri 1.0 (tam görünür)

  @override
  void initState() {
    super.initState();

    final vm = context.read<CameraViewModel>();

    vm.addListener(_onViewModelChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.initCamera();
    });
  }

  void _onViewModelChanged() {
    final vm = context.read<CameraViewModel>();

    if (vm.permissionStatus == CameraPermissionStatus.denied) {
      context.go('/home/chooseDrawType');
      vm.resetPermissionStatus();
    }
  }

  @override
  void dispose() {
    context.read<CameraViewModel>().removeListener(_onViewModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Stack(
        children: [
          _buildCamera(),

          // Resim ile etkileşim katmanı
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onScaleStart: (details) {
                previousScale = scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  position += details.focalPointDelta;
                  scale = previousScale * details.scale;
                  scale = scale.clamp(0.3, 15.0);
                });
              },
              onScaleEnd: (_) {},
            ),
          ),

          // Resim - ŞEFFAFLıK UYGULANACAK YER
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Opacity(
              opacity: currentOpacity, // BU DEĞİŞKEN SLIDER İLE DEĞİŞİYOR
              child: Transform.scale(
                scale: scale,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    widget.categoryEntity.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // UI Kontrolleri
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.go('/home');
                          },
                          child: SvgPicture.asset(
                            "assets/icons/arrow_back_icon.svg",
                            width: 32,
                            height: 32,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          "assets/icons/how_use_icon.svg",
                          width: 32,
                          height: 32,
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/icons/extedn_default_icon.svg",
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _openDetailPanel(
                          initialOpacity: currentOpacity,
                          onOpacityChanged: (value) {
                            setState(() {
                              currentOpacity = value; // BURASI ÖNEMLİ!
                            });
                          },
                          onItemSelected: (val) {
                            setState(() {
                              selectedItem = val;
                            });
                          },
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/icons/open_menu_icons.svg",
                        width: 42,
                        height: 42,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCamera() {
    return SizedBox.expand(
      child: Consumer<CameraViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.controller == null || !viewModel.isInitialized) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CameraPreview(viewModel.controller!);
        },
      ),
    );
  }

  Widget _buildItem(Function function, String icon, String title, bool isActive) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/$icon",
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(
              isActive ? Color(0xFF50C4ED) : Color(0xFFD0D0D0),
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? Color(0xFF50C4ED) : Color(0xFFD0D0D0),
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  void _openDetailPanel({
    required double initialOpacity,
    required ValueChanged<double> onOpacityChanged,
    required ValueChanged<int> onItemSelected,
  }) {
    int localSelectedItem = selectedItem;
    double opacity = initialOpacity;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.9,
              minChildSize: 0.2,
              builder: (_, controller) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.all(16),
                    children: [
                      // SLIDER - Sadece şeffaflık seçiliyse göster
                      if (localSelectedItem == 1)
                        Column(
                          children: [
                            Text(
                              "Şeffaflık: ${(opacity * 100).round()}%",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF50C4ED),
                              ),
                            ),
                            SizedBox(height: 8),
                            Slider(
                              value: opacity,
                              min: 0.0,
                              max: 1.0,
                              divisions: 100,
                              activeColor: Color(0xFF50C4ED),
                              inactiveColor: Color(0xFFD0D0D0),
                              onChanged: (value) {
                                setModalState(() {
                                  opacity = value;
                                });
                                onOpacityChanged(value); // ANA EKRANI GÜNCELLE
                              },
                            ),
                            SizedBox(height: 16),
                          ],
                        ),

                      // BUTONLAR
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildItem(() {
                              setModalState(() {
                                localSelectedItem = 1;
                              });
                              onItemSelected(1);
                            }, "opacity_icon.svg", "şeffaflık", localSelectedItem == 1),
                            _buildItem(() {
                              setModalState(() {
                                localSelectedItem = 2;
                              });
                              onItemSelected(2);
                            }, "lock_icon.svg", "lock", localSelectedItem == 2),
                            _buildItem(() {
                              setModalState(() {
                                localSelectedItem = 3;
                              });
                              onItemSelected(3);
                            }, "opacity_icon.svg", "video", localSelectedItem == 3),
                            _buildItem(() {
                              setModalState(() {
                                localSelectedItem = 4;
                              });
                              onItemSelected(4);
                            }, "off_flash_icon.svg", "flash", localSelectedItem == 4),
                            _buildItem(() {
                              setModalState(() {
                                localSelectedItem = 5;
                              });
                              onItemSelected(5);
                            }, "image_plus_icon.svg", "add image", localSelectedItem == 5),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}