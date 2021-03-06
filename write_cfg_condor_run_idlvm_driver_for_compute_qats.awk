BEGIN{
#0.  Print common header
  print "Universe = Vanilla"
  print "Executable = /astro/net/astro-agol/blevlee/CODE/IDL/KEPLER_REDUX/autopulse/run_idlvm_driver_for_compute_qats.bsh"
  print "Initialdir = /astro/net/astro-agol/blevlee/CODE/IDL/KEPLER_REDUX/autopulse"
  print "Log = /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/log/condor.log"
  print "error = /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/log/condor.err"
  print "getenv = True"
  print ""
  queue_index_number=0
}
{
#1.  Set up directories for this KID
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/log")
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1)
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/0")
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/0/log")
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/1")
  system("mkdir /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/1/log")

#2.  Set up condor queue item for no planet masking
  print "#Queue_index_number:" queue_index_number
  print "Output = /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/0/log/printed.out"
  print "Arguments = "$1" 0.005 '[1.0,300.0]' 0 /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/0 /astro/net/astro-agol/blevlee/CODE/IDL/KEPLER_REDUX/autopulse"
  print "Notification = Never"
  print "Queue"
  print ""
  queue_index_number=queue_index_number+1

#3.  Set up condor queue item with planet masking
  print "#Queue_index_number:" queue_index_number
  print "Output = /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/1/log/printed.out"
  print "Arguments = "$1" 0.005 '[1.0,300.0]' 1 /astro/net/astro-agol/blevlee/CODE/condor/test3/test_working_dir3/"$1"/1 /astro/net/astro-agol/blevlee/CODE/IDL/KEPLER_REDUX/autopulse"
  print "Notification = Never"
  print "Queue"
  print ""
  queue_index_number=queue_index_number+1
}
END{}
#@example:
#awk -f write_cfg_condor_run_idlvm_driver_for_compute_qats.awk koikids.txt > condor_run_idlvm_driver_for_compute_qats.cfg
