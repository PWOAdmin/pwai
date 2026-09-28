with AUnit.Reporter.Text;
with AUnit.Run;
with Test_Json;

procedure Test_Runner is
   procedure Run is new AUnit.Run.Test_Runner (Test_Json.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run (Reporter);
end Test_Runner;