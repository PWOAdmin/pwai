with AUnit;
with AUnit.Simple_Test_Cases;
with AUnit.Test_Suites;

package Test_Json is

   type Test is new AUnit.Simple_Test_Cases.Test_Case with null record;

   overriding function Name (T : Test) return AUnit.Message_String;
   overriding procedure Run_Test (T : in out Test);

   function Suite return AUnit.Test_Suites.Access_Test_Suite;

end Test_Json;