package body AI_Model is

      procedure Set_Model_Name (Model  : in out Model_Type; Name: in String) is
      begin
         Model.Model_Name := To_Unbounded_String(Name);
      end Set_Model_Name;

   function Get_Model_Name (Model: in Model_Type) return String is
   begin
      return To_String(Model.Model_Name);
   end Get_Model_Name;

   function To_JSON (Model: in Model_Type) return String is
      Obj: Gnatcoll.JSON.JSON_Value := Gnatcoll.JSON.Create_Object;
   begin
      Obj.Set_Field("id", To_String(Model.Model_Name));
      return Obj.Write(False);

            end To_JSON;   

   function From_JSON (Obj: in String) return Model_Type is
      Model: Model_Type;
      Val: Gnatcoll.JSON.JSON_Value := Gnatcoll.JSON.Read(Obj);
   begin
      Model.Model_Name := Gnatcoll.JSON.Get(Val, "id");
      return Model;
   end From_JSON;

end AI_Model;
