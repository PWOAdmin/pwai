with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Gnatcoll.JSON;
use Gnatcoll.JSON;

package AI_Model
 is

 type Model_Type Is tagged private;

   procedure Set_Model_Name (Model: in out Model_Type; Name: in String);
   function Get_Model_Name (Model: in Model_Type) return String;

function To_JSON (Model: in Model_Type) return String;
   
   function From_JSON (Obj: in String) return Model_Type; 
   
private

type Model_Type is tagged record
   Model_Name: Unbounded_String;
end record;
   
end AI_Model;