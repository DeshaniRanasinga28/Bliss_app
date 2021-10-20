import 'package:bliss/app/provider/item_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
   ChangeNotifierProvider<ItemProviderModel>(create: (_) => ItemProviderModel()),
];