With Ai_Message;
package AI_Request is

   type Request_Type is tagged private;
   type Request_Type_Access is access all Request_Type'Class;

   procedure Set_Request_Model
     (Request : in out Request_Type'Class;
      Model   : String);
   function Get_Request_Model (Request : Request_Type'Class) return String;

   procedure Set_Request_Messages
     (Request  : in out Request_Type'Class;
      Messages : AI_Message.Message_Vectors.Vector);
   function Get_Request_Messages
     (Request : Request_Type'Class) return AI_Message.Message_Vectors.Vector;

   function To_JSON (Request : Request_Type'Class) return String;
   function From_JSON (Obj : String) return Request_Type'Class;

   procedure Free (Request : in out Request_Type_Access);

   private

   Type Request_Type is tagged record
      Model    : String := "";
      Messages : AI_Message.Message_Vectors.Vector;
      Temperature : Float := 0.7;
      Max_Tokens : Integer := 2048;

   end record;

   end AI_Request;