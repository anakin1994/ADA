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
with rcall;
pragma Elaborate_All
  (rcall);
with polyorb.dsa_p.partitions;
pragma Elaborate_All
  (polyorb.dsa_p.partitions);
with rci;
pragma Elaborate_All
  (rci);
package body Partition is
begin
   System.Partition_Interface.Activate_Rpc_Receivers;
   System.Partition_Interface.Check
     ("rci",
      rci'Version,
      TRUE);
   rcall;
end Partition;
