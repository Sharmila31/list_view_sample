/*
* Note:
* Variables prefixed with underscore are private variables
* Only private variables can have getters and setters
* Adding ? to data type takes that variable as nullable parameter
* Optional/Named arguments cannot be declared as private
* Optional/Named arguments should be declared as either nullable or it should be changed to required variable
*/
class Dispatch
{
  String _DispatchNumber="";
  int _DispatchId=0;
  String _PickUpLocation="";
  String _DeliveryLocation="";
  String? Status;
  String _PickUpDate="";
  String? DeliveryDate;

  Dispatch(this._DispatchNumber,this._DispatchId,this._PickUpLocation,this._DeliveryLocation,this._PickUpDate,{this.Status,this.DeliveryDate});

  String get DispatchNumber => _DispatchNumber;

  set DispatchNumber(String value) {
    _DispatchNumber = value;
  }

  int get DispatchId => _DispatchId;

  String get PickUpDate => _PickUpDate;

  set PickUpDate(String value) {
    _PickUpDate = value;
  }

  String get DeliveryLocation => _DeliveryLocation;

  set DeliveryLocation(String value) {
    _DeliveryLocation = value;
  }

  String get PickUpLocation => _PickUpLocation;

  set PickUpLocation(String value) {
    _PickUpLocation = value;
  }

  set DispatchId(int value) {
    _DispatchId = value;
  }
}