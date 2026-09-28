with AUnit.Assertions;
with AUnit.Simple_Test_Cases;
with AUnit.Test_Suites;
with AI_Model;

package body Test_Json is

   function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("AI_Model JSON round-trip");
   end Name;

   procedure Run_Test (T : in out Test) is
      pragma Unreferenced (T);
      Model : AI_Model.Model_Type;
   begin
      AI_Model.Set_Model_Name (Model, "gpt-4");

      declare
         Model_Json : constant String := AI_Model.To_JSON (Model);
         Model_From_Json : constant AI_Model.Model_Type :=
           AI_Model.From_JSON (Model_Json);
      begin
         AUnit.Assertions.Assert
           (AI_Model.Get_Model_Name (Model_From_Json) = "gpt-4",
            "Model name mismatch after JSON serialization/deserialization");
      end;
   end Run_Test;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      use AUnit.Simple_Test_Cases;
      use AUnit.Test_Suites;
      Result : constant Access_Test_Suite := new Test_Suite;
   begin
      Result.Add_Test (Test_Case_Access'(new Test));
      return Result;
   end Suite;

end Test_Json;