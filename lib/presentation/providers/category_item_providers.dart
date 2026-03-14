import 'package:litra_ar_draw_app/data/datasource/local/mock_content_datasource.dart';
import 'package:litra_ar_draw_app/data/repositories/content_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_content_repository.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_content_item_use_case.dart';
import 'package:litra_ar_draw_app/presentation/view_models/atelier_view_model.dart';
import 'package:provider/provider.dart';

final mainProviders = [

  Provider<MockContentDatasource>(
    create: (_) => MockContentDatasource(),
  ),

  Provider<UseContentRepository>(
    create: (context) => ContentRepositoryImpl(
      datasource: context.read<MockContentDatasource>(), // ✅ Düzeltildi
    ),
  ),

  Provider<GetContentItemUseCase>(
    create: (context) => GetContentItemUseCase(
      contentRepository: context.read<UseContentRepository>(),
    ),
  ),

  ChangeNotifierProvider<AtelierViewModel>(
    create: (context) => AtelierViewModel(
      getContentItemUseCase: context.read<GetContentItemUseCase>(),
    ),
  ),

];