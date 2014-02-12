/*
Author: KoffeinFlummi

Do I really need to explain what this does?!
*/

_unit = _this select 0;

BWA3_setVariables = {
  _this setVariable ["BWA3_Blood", 1];           // Amount of blood in the body.
  _this setVariable ["BWA3_Bleeding", false];    // Is the unit losing blood? (Rate is determined by damage.)
  _this setVariable ["BWA3_Painkiller", 1];      // How much painkillers the guy is on.
  _this setVariable ["BWA3_Pain", 0];            // Amount of pain the unit is in.
  _this setVariable ["BWA3_InPain", false];      // Is the weid effect going on?
  _this setVariable ["BWA3_Epinephrine", false]; // Is the unit under the influence of epinephrine?
  _this setVariable ["BWA3_Dead", 0];            // 1 for dead, but revivable units (damage == 1 means unrevivable), 0 for alive ones
  _this setVariable ["BWA3_Unconscious", false]; // figure it out
  _this setVariable ["BWA3_Dragging", false];
  _this setVariable ["BWA3_Carrying", false];
};
_unit call BWA3_setVariables;

_unit addEventHandler ["HandleDamage", {_this call BWA3_Medical_fnc_handleDamage}];
_unit addEventHandler ["Respawn", {(_this select 0) call BWA3_setVariables}];