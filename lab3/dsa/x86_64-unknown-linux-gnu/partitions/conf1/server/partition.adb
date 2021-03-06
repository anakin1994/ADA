pragma Warnings (Off);
pragma Style_Checks ("NM32766");
with Polyorb.ORB;
pragma Elaborate_All
  (Polyorb.ORB);
with Polyorb.Initialization;
pragma Elaborate_All
  (Polyorb.Initialization);
with Polyorb.Setup;
pragma Elaborate_All
  (Polyorb.Setup);
with System.Partition_Interface;
pragma Elaborate_All
  (System.Partition_Interface);
with System.Dsa_Services;
pragma Elaborate_All
  (System.Dsa_Services);
with rci;
pragma Elaborate_All
  (rci);
package body Partition is
begin
   System.Partition_Interface.Activate_Rpc_Receivers;
   Polyorb.ORB.Run
     (Polyorb.Setup.The_ORB,
      May_Exit => False);
end Partition;
