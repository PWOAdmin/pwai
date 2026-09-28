with Ada.Characters.Handling;
with Ada.Unchecked_Deallocation;
with GNATCOLL.JSON;

package body AI_Message is

   procedure Dealloc is new Ada.Unchecked_Deallocation
     (Object => Message_Type'Class,
      Name   => Message_Type_Access);

   procedure Set_Message_Content
       (Message : in out Message_Type'Class;
         Content : String)
   is
   begin
      Message.Content := Ada.Strings.Unbounded.To_Unbounded_String (Content);
   end Set_Message_Content;

   function Get_Message_Content (Message : Message_Type'Class) return String is
   begin
      return Ada.Strings.Unbounded.To_String (Message.Content);
   end Get_Message_Content;

   function To_JSON (Message : Message_Type'Class) return String is
      Obj : constant GNATCOLL.JSON.JSON_Value := GNATCOLL.JSON.Create_Object;
      Role_Name : constant String := Ada.Characters.Handling.To_Lower
        (Role_Type'Image (Message.Role));
   begin
      Obj.Set_Field ("role", Role_Name);
      Obj.Set_Field
        ("content", Ada.Strings.Unbounded.To_String (Message.Content));
      return Obj.Write (False);
   end To_JSON;

   function From_JSON (Obj : String) return Message_Type'Class is
      Value : constant GNATCOLL.JSON.JSON_Value := GNATCOLL.JSON.Read (Obj);
      Message : Message_Type;
      Role_Name : constant String := GNATCOLL.JSON.Get (Value, "role");
   begin
      Message.Role := Role_Type'Value
        (Ada.Characters.Handling.To_Upper (Role_Name));
      Message.Content := GNATCOLL.JSON.Get (Value, "content");
      return Message;
   end From_JSON;

   procedure Free (Message : in out Message_Type_Access) is
   begin
      Dealloc (Message);
   end Free;

end AI_Message;