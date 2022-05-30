import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }

  int _selectedCustomSwitch = 0;

  int get selectedCustomSwitch {
    return _selectedCustomSwitch;
  }

  set selectedCustomSwitch(int i) {
    _selectedCustomSwitch = i;
    notifyListeners();
  }

  int _selectedToggleSwitch = 0;

  int get selectedToggleSwitch {
    return _selectedToggleSwitch;
  }

  set selectedToggleSwitch(int i) {
    _selectedToggleSwitch = i;
    notifyListeners();
  }

  int _selectedClosedBody = 0;

  int get selectedClosedBody {
    return _selectedClosedBody;
  }

  set selectedClosedBody(int i) {
    _selectedClosedBody = i;
    notifyListeners();
  }

  int _selectedIncludesMaterials = 0;

  int get selectedIncludesMaterials {
    return _selectedIncludesMaterials;
  }

  set selectedIncludesMaterials(int i) {
    _selectedIncludesMaterials = i;
    notifyListeners();
  }

  int _selectedAvailabilityBudgetReceived = 0;

  int get selectedAvailabilityBudgetReceived {
    return _selectedAvailabilityBudgetReceived;
  }

  set selectedAvailabilityBudgetReceived(int i) {
    _selectedAvailabilityBudgetReceived = i;
    notifyListeners();
  }
}
