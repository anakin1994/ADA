pragma Warnings (Off);
pragma Style_Checks ("NM32766");
pragma Ada_2005;
with Polyorb.Setup.Base;
pragma Elaborate_All
  (Polyorb.Setup.Base);
with Polyorb.Setup.Iiop;
pragma Elaborate_All
  (Polyorb.Setup.Iiop);
with Polyorb.Setup.Tasking.Full_Tasking;
with Polyorb.ORB.Thread_Pool;
with Polyorb.Setup.Access_Points.Iiop;
with Polyorb.Parameters;
use  Polyorb.Parameters;
with Polyorb.Initialization;
use  Polyorb.Initialization;
pragma Elaborate_All
  (Polyorb.Initialization);
with Polyorb.Utils;
use  Polyorb.Utils;
with Polyorb.Utils.Strings;
use  Polyorb.Utils.Strings;
with Polyorb.Utils.Strings.Lists;
use  Polyorb.Utils.Strings.Lists;
with Polyorb.Utils.Strings.Lists;
use  Polyorb.Utils.Strings.Lists;
with Polyorb.Tasking.Threads;
use  Polyorb.Tasking.Threads;
with Polyorb.Dsa_P.Name_Service.Cos_Naming;
package body Polyorb.Partition_Elaboration is
   procedure Full_Launch is
   begin
      null;
   end Full_Launch;
   procedure Run_Additional_Tasks is
   begin
      null;
   end Run_Additional_Tasks;
   procedure Configure
     (Set_Conf : access procedure (Section, Key, Value : String))
   is
   begin
      Set_Conf
        (Section => "dsa",
         Key     => "termination_initiator",
         Value   => "true");
      Set_Conf
        (Section => "dsa",
         Key     => "partition_name",
         Value   => "client");
      Set_Conf
        (Section => "dsa",
         Key     => "main_partition",
         Value   => "TRUE");
      Set_Conf
        (Section => "dsa",
         Key     => "tasking_available",
         Value   => "TRUE");
      Set_Conf
        (Section => "dsa",
         Key     => "termination_policy",
         Value   => "Global_Termination");
      Set_Conf
        (Section => "dsa",
         Key     => "boot_location",
         Value   => "tcp://localhost:5678");
      Set_Conf
        (Section => "dsa",
         Key     => "name_server_kind",
         Value   => "Standalone");
      Set_Conf
        (Section => "dsa",
         Key     => "rsh_command",
         Value   => "rsh");
      Set_Conf
        (Section => "dsa",
         Key     => "rsh_options",
         Value   => "");
      Set_Conf
        (Section => "dsa",
         Key     => "rcall'partition",
         Value   => "client");
      Set_Conf
        (Section => "dsa",
         Key     => "polyorb.dsa_p.partitions'partition",
         Value   => "client");
      Set_Conf
        (Section => "dsa",
         Key     => "rci'partition",
         Value   => "server");
      Polyorb.Dsa_P.Name_Service.Name_Ctx :=
        new Polyorb.Dsa_P.Name_Service.Cos_Naming.Cos_Name_Server;
   end Configure;
end Polyorb.Partition_Elaboration;
