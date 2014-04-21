/*
 * Author: KoffeinFlummi
 *
 * Checks if a vehicle is equipped with an FCS and if so, adds the fired event handler
 *
 * Arguments:
 * 0: Vehicle 
 *
 * Return Value:
 * none
 */

if (getNumber (configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "BWA3_FCSEnabled") == 1) then {
  (_this select 0) addEventHandler ["Fired", {_this call BWA3_FCS_fnc_firedEH}];

  // calculate offset between gunner camera and muzzle position
  _gunBeg = getText (configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "Turrets" >> "MainTurret" >> "gunBeg");
  _gunnerView = getText (configFile >> "CfgVehicles" >>  (typeOf (_this select 0)) >> "Turrets" >> "MainTurret" >> "memoryPointGunnerOptics");
  _gunBegPos = ((_this select 0) selectionPosition _gunBeg) select 0;
  _gunnerViewPos = ((_this select 0) selectionPosition _gunnerView) select 0;
  _viewDiff = _gunBegPos - _gunnerViewPos;
  (_this select 0) setVariable ["BWA3_FCSViewDiff", _viewDiff, true];
  player globalChat format["ViewDiff: %1", _viewDiff];
};