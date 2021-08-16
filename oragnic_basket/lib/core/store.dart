import 'package:oragnic_basket/models/product_models.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Cart.dart';

class MyStore extends VxStore {

  Cart cart;

//spinner dekhase tyare true thase
  bool isLoading = false;

  MyStore() {
    cart = Cart();
  }
}
  class ToggleLoading extends VxMutation<MyStore>
  {
  @override
  perform() {
    store.isLoading = !store.isLoading;
  }

  }


