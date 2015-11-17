-module(exp).
-compile(export_all).

-spec area({circular, Radii :: integer()}) -> Area :: integer() ;
	({rightTriangle, SideLen1 :: integer(), SideLen2 :: integer()}) -> Area :: integer().
area({circular, _Radii}) -> 123;
area({rightTriangle, _SideLen1, _SideLen2}) -> 456 . 
