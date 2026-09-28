
with Ada.Containers.Indefinite_Vectors;
with Ada.Strings.Unbounded;
package AI_Message is

   type Role_Type is (System, User, Tool, Assistant);

   type Message_Type is tagged private;
   type Message_Type_Access is access all Message_Type'Class;

   package Message_Vectors is new Ada.Containers.Indefinite_Vectors
     (Index_Type   => Positive,
      Element_Type => Message_Type_Access);

   procedure Set_Message_Content
     (Message : in out Message_Type'Class;
      Content : String);
   function Get_Message_Content (Message : Message_Type'Class) return String;

   function To_JSON (Message : Message_Type'Class) return String;
   function From_JSON (Obj : String) return Message_Type'Class;

   procedure Free (Message : in out Message_Type_Access);

private

   type Message_Type is tagged record
      Role    : Role_Type := System;
      Content : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end AI_Message;