#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
case "$target" in
    "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627a"  | "msm7627_surf" | \
    "qsd8250_surf" | "qsd8250_ffa" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion" | "qsd8650a_st1x")
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        ;;
esac

case "$target" in
    "msm7201a_ffa" | "msm7201a_surf")
        echo 500000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
        echo 75000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 1 > /sys/module/pm2/parameters/idle_sleep_mode
        ;;
esac

case "$target" in
     "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627_surf" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion" | "msm7627a" )
        echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;
esac

case "$target" in
    "msm8660")
     echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
     echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
     echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
     echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
     echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
     echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
     echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
     echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
     echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
     echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
     echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
     echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
     chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
     chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown -h root.system /sys/devices/system/cpu/mfreq
     chmod -h 220 /sys/devices/system/cpu/mfreq
     chown -h root.system /sys/devices/system/cpu/cpu1/online
     chmod -h 664 /sys/devices/system/cpu/cpu1/online
        ;;
esac

case "$target" in
    "msm8960")
         echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
         echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem
         echo 1 > /sys/module/pm_8x60/modes/cpu0/retention/idle_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu2/power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu3/power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
	 echo 0 > /sys/module/msm_thermal/core_control/enabled
         echo 1 > /sys/devices/system/cpu/cpu1/online
         echo 1 > /sys/devices/system/cpu/cpu2/online
         echo 1 > /sys/devices/system/cpu/cpu3/online
         echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
         echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
         echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
         echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
         echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
         echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
         echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
         echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
         echo 918000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
         echo 1026000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
         echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
         echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
	 echo 1 > /sys/module/msm_thermal/core_control/enabled
         chown -h root.system /sys/devices/system/cpu/mfreq
         chmod -h 220 /sys/devices/system/cpu/mfreq
         chown -h root.system /sys/devices/system/cpu/cpu1/online
         chown -h root.system /sys/devices/system/cpu/cpu2/online
         chown -h root.system /sys/devices/system/cpu/cpu3/online
         chmod -h 664 /sys/devices/system/cpu/cpu1/online
         chmod -h 664 /sys/devices/system/cpu/cpu2/online
         chmod -h 664 /sys/devices/system/cpu/cpu3/online
         # set DCVS parameters for CPU
         echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu0/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu0/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu1/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu1/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu2/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu2/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu2/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu2/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu2/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu2/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu3/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu3/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu3/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu3/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu3/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu3/disable_pc_threshold
         # set DCVS parameters for GPU
         echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_max_us
         echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_min_us
         echo 0 > /sys/module/msm_dcvs/cores/gpu0/slack_mode_dynamic
         # set msm_mpdecision parameters
         echo 45000 > /sys/module/msm_mpdecision/slack_time_max_us
         echo 15000 > /sys/module/msm_mpdecision/slack_time_min_us
         echo 100000 > /sys/module/msm_mpdecision/em_win_size_min_us
         echo 1000000 > /sys/module/msm_mpdecision/em_win_size_max_us
         echo 3 > /sys/module/msm_mpdecision/online_util_pct_min
         echo 25 > /sys/module/msm_mpdecision/online_util_pct_max
         echo 97 > /sys/module/msm_mpdecision/em_max_util_pct
         echo 2 > /sys/module/msm_mpdecision/rq_avg_poll_ms
         echo 10 > /sys/module/msm_mpdecision/mp_em_rounding_point_min
         echo 85 > /sys/module/msm_mpdecision/mp_em_rounding_point_max
         echo 50 > /sys/module/msm_mpdecision/iowait_threshold_pct
         #set permissions for the nodes needed by display on/off hook
         chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         chown -h system /sys/module/msm_mpdecision/slack_time_max_us
         chown -h system /sys/module/msm_mpdecision/slack_time_min_us
         chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         chmod -h 664 /sys/module/msm_mpdecision/slack_time_max_us
         chmod -h 664 /sys/module/msm_mpdecision/slack_time_min_us
         if [ -f /sys/devices/soc0/soc_id ]; then
             soc_id=`cat /sys/devices/soc0/soc_id`
         else
             soc_id=`cat /sys/devices/system/soc/soc0/id`
         fi
         case "$soc_id" in
             "130")
                 echo 230 > /sys/class/gpio/export
                 echo 228 > /sys/class/gpio/export
                 echo 229 > /sys/class/gpio/export
                 echo "in" > /sys/class/gpio/gpio230/direction
                 echo "rising" > /sys/class/gpio/gpio230/edge
                 echo "in" > /sys/class/gpio/gpio228/direction
                 echo "rising" > /sys/class/gpio/gpio228/edge
                 echo "in" > /sys/class/gpio/gpio229/direction
                 echo "rising" > /sys/class/gpio/gpio229/edge
                 echo 253 > /sys/class/gpio/export
                 echo 254 > /sys/class/gpio/export
                 echo 257 > /sys/class/gpio/export
                 echo 258 > /sys/class/gpio/export
                 echo 259 > /sys/class/gpio/export
                 echo "out" > /sys/class/gpio/gpio253/direction
                 echo "out" > /sys/class/gpio/gpio254/direction
                 echo "out" > /sys/class/gpio/gpio257/direction
                 echo "out" > /sys/class/gpio/gpio258/direction
                 echo "out" > /sys/class/gpio/gpio259/direction
                 chown -h media /sys/class/gpio/gpio253/value
                 chown -h media /sys/class/gpio/gpio254/value
                 chown -h media /sys/class/gpio/gpio257/value
                 chown -h media /sys/class/gpio/gpio258/value
                 chown -h media /sys/class/gpio/gpio259/value
                 chown -h media /sys/class/gpio/gpio253/direction
                 chown -h media /sys/class/gpio/gpio254/direction
                 chown -h media /sys/class/gpio/gpio257/direction
                 chown -h media /sys/class/gpio/gpio258/direction
                 chown -h media /sys/class/gpio/gpio259/direction
                 echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_dig
                 echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_mem
                 ;;
         esac
         ;;
esac

case "$target" in
    "msm8974")
        # Permissions for Camera to flush cache buffers
        chown -h system.system /sys/devices/virtual/sec/sec_misc/drop_caches
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo 0 > /proc/sys/kernel/sched_wake_to_idle
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi

        # Change msm_pm sysfs permission
        chmod -h 0664 /sys/module/msm_pm/modes/cpu0/power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu1/power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu2/power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu3/power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu0/retention/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu1/retention/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu2/retention/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu3/retention/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu0/wfi/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu1/wfi/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu2/wfi/*
        chmod -h 0664 /sys/module/msm_pm/modes/cpu3/wfi/*

        if [ "$soc_id" != "0" ]; then
            # Set default governor as interactive
            # Change governor to interactive
            echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
            echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
            echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
            echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
            # Change interactive sysfs permission
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_rate
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_slack
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/target_loads
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boost
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boostpulse
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/input_boost
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/enforced_mode
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/mode
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/multi_enter_load
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/multi_enter_time
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/multi_exit_load
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/multi_exit_time
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/param_index
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/single_enter_load
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/single_enter_time
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/single_exit_load
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/single_exit_time
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/sync_freq
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_freq
            chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/target_loads
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/boost
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/input_boost
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
            #Mode Change Condition
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/param_index
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/multi_enter_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/multi_enter_time
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/multi_exit_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/multi_exit_time
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/single_enter_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/single_enter_time
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/single_exit_load
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/single_exit_time
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/enforce_mode
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/mode
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/sync_freq
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_freq
            chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_load
            # Change cpu-boost sysfs permission
            chown -h system.system /sys/module/cpu_boost/parameters/sync_threshold
            chown -h system.system /sys/module/cpu_boost/parameters/boost_ms
            chmod -h 0660 /sys/module/cpu_boost/parameters/sync_threshold
            chmod -h 0660 /sys/module/cpu_boost/parameters/boost_ms

            product_name=`getprop ro.product.name`
            case "$product_name" in
                klte*)
                    # Change interactive governor parameters
                    #Mode Change Condition
                    echo 340 > /sys/devices/system/cpu/cpufreq/interactive/multi_enter_load
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/multi_enter_time
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/multi_exit_load
                    echo 299000 > /sys/devices/system/cpu/cpufreq/interactive/multi_exit_time
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/single_enter_load
                    echo 199000 > /sys/devices/system/cpu/cpufreq/interactive/single_enter_time
                    echo 60 > /sys/devices/system/cpu/cpufreq/interactive/single_exit_load
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/single_exit_time
                    #Default Mode Parameter
                    echo 0 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
                    echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo "20000 1400000:80000 1500000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo "85 1400000:90 1700000:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Single Mode Parameter
                    echo 1 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1497600 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 59000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "60 800000:65 1400000:65 1700000:75" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 150000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Multi Mode Parameter
                    echo 2 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1728000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 79000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "50 800000:60 1400000:65" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 200000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Single & Multi Mode Parameter
                    echo 3 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 85 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1958400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "50 1400000:60" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 300000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #set default
                    echo 0 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    ;;
                *)
                    # Change interactive governor parameters
                    #Mode Change Condition
                    echo 340 > /sys/devices/system/cpu/cpufreq/interactive/multi_enter_load
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/multi_enter_time
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/multi_exit_load
                    echo 299000 > /sys/devices/system/cpu/cpufreq/interactive/multi_exit_time
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/single_enter_load
                    echo 199000 > /sys/devices/system/cpu/cpufreq/interactive/single_enter_time
                    echo 60 > /sys/devices/system/cpu/cpufreq/interactive/single_exit_load
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/single_exit_time
                    #Default Mode Parameter
                    echo 0 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
                    echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo "20000 1400000:80000 1500000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo "85 1400000:90 1700000:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Single Mode Parameter
                    echo 1 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1497600 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 59000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "60 800000:65 1400000:70 1700000:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 150000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Multi Mode Parameter
                    echo 2 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1728000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 79000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "50 800000:60 1400000:70" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 200000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #Single & Multi Mode Parameter
                    echo 3 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    echo 19000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 85 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                    echo 1958400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo 99000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                    echo "50 1200000:60" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                    echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                    echo 300000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                    #set default
                    echo 0 > /sys/devices/system/cpu/cpufreq/interactive/param_index
                    ;;
            esac

            # Setting parameters for slte project
            case "$product_name" in
                slte*)
                    echo 883200 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                    echo "40000 800000:60000 1000000:100000 1200000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                    echo 40 > /sys/class/kgsl/kgsl-3d0/idle_timer
                    ;;
            esac

            # Setting cpu-boost parameters
            echo 10 > /sys/module/cpu_boost/parameters/boost_ms

            case "$product_name" in
                mondrian* | picasso* | vienna* | lt03*)
                    # Setting sync_threshold for WQHD
                    echo 1574400 > /sys/module/cpu_boost/parameters/sync_threshold
                    ;;
                slte*)
                    # Setting sync_threshold for HD
                    echo 883200 > /sys/module/cpu_boost/parameters/sync_threshold
                    ;;
                *)
                    # Setting sync_threshold for FHD
                    echo 1190400 > /sys/module/cpu_boost/parameters/sync_threshold
                    ;;
            esac

        else
            # Settings for ondemand
            # Change governor to ondemand
            echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
            echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
            echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
            echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
            # Change ondemand governor parameters
            echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
            echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
            echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
            echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
            echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
            echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
            echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
            echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
            echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
            echo 1190400 > /sys/devices/system/cpu/cpufreq/ondemand/input_boost
            echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
            # Change ondemand sysfs permission
            chown -h radio.system /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
            chown -h radio.system /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
            chown -h radio.system /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
            chown -h radio.system /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
            chmod -h 664 /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
            chmod -h 664 /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
            chmod -h 664 /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
            chmod -h 664 /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
        fi

	case "$soc_id" in
	"208" | "211" | "214" | "217" | "209" | "212" | "215" | "218" | "194" | "210" | "213" | "216")
		echo cpubw_hwmon > /sys/class/devfreq/0.qcom,cpubw/governor

		# Change cpubw sysfs permission
		chown radio.system /sys/class/devfreq/0.qcom,cpubw/available_frequencies
		chown radio.system /sys/class/devfreq/0.qcom,cpubw/available_governors
		chown radio.system /sys/class/devfreq/0.qcom,cpubw/governor
		chown radio.system /sys/class/devfreq/0.qcom,cpubw/max_freq
		chown radio.system /sys/class/devfreq/0.qcom,cpubw/min_freq
		chown -h system.system /sys/class/devfreq/0.qcom,cpubw/cpubw_hwmon/guard_band_mbps
		chown -h system.system /sys/class/devfreq/0.qcom,cpubw/cpubw_hwmon/io_percent
		chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/available_frequencies
		chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/available_governors
		chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/governor
		chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/max_freq
		chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/min_freq
		chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/cpubw_hwmon/guard_band_mbps
		chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/cpubw_hwmon/io_percent
	esac

        chown system /sys/class/kgsl/kgsl-3d0/min_pwrlevel
        chown system /sys/class/kgsl/kgsl-3d0/max_pwrlevel
        chmod 664 /sys/class/kgsl/kgsl-3d0/min_pwrlevel
        chmod 664 /sys/class/kgsl/kgsl-3d0/max_pwrlevel

        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
        echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate

        # Change PM debug parameters permission
        chown -h system.system /sys/module/qpnp_power_on/parameters/reset_enabled
        chown -h system.system /sys/module/qpnp_power_on/parameters/wake_enabled
        chown -h system.system /sys/module/qpnp_int/parameters/debug_mask
        chown -h system.system /sys/module/lpm_levels/parameters/secdebug
        chmod -h 664 /sys/module/qpnp_power_on/parameters/reset_enabled
        chmod -h 664 /sys/module/qpnp_power_on/parameters/wake_enabled
        chmod -h 664 /sys/module/qpnp_int/parameters/debug_mask
        chmod -h 664 /sys/module/lpm_levels/parameters/secdebug
        chmod -h 444 /sys/kernel/wakeup_reasons/last_resume_reason

        # Permissions for Audio
        chown system.system /sys/devices/fe12f000.slim/es705-codec-gen0/keyword_grammar_path
        chown system.system /sys/devices/fe12f000.slim/es705-codec-gen0/keyword_net_path

        # control daemon for xosd
        factory_mode=`getprop ro.factory.factory_binary`
        if [ "$factory_mode" != "factory" ]; then
            case "$product_name" in
                hlte* | klte* | slte*)
                    jig_mode=`cat /sys/class/switch/uart3/state`
                    case "$jig_mode" in
                    1)
                        echo "PM: JIG UART" > /dev/kmsg
                    ;;
                    0)
                        echo "PM: stop at_distributor" > /dev/kmsg
                        stop at_distributor
                    ;;
                    esac
                ;;
            esac
        fi

    ;;
esac

case "$target" in
    "msm8226")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
        echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
        echo 787200 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
        echo 300000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
        echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
        echo 787200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_early_factor
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_interim_factor
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chown radio.system /sys/devices/system/cpu/cpufreq/ondemand/sampling_early_factor
        chown radio.system /sys/devices/system/cpu/cpufreq/ondemand/sampling_interim_factor
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
        chmod 664 /sys/devices/system/cpu/cpufreq/ondemand/sampling_early_factor
        chmod 664 /sys/devices/system/cpu/cpufreq/ondemand/sampling_interim_factor
    ;;
esac

case "$target" in
    "msm8610")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
        echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
        echo 787200 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
        echo 300000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
        echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
        echo 787200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        setprop ro.qualcomm.perf.min_freq 7
        echo 1 > /sys/kernel/mm/ksm/deferred_timer
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
    ;;
esac

case "$target" in
    "apq8084")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        setprop ro.qualcomm.perf.cores_online 2
        chown -h  system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
    ;;
esac

case "$target" in
    "msm7627_ffa" | "msm7627_surf" | "msm7627_6x")
        echo 25000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8250_surf" | "qsd8250_ffa" | "qsd8650a_st1x")
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8650a_st1x")
        mount -t debugfs none /sys/kernel/debug
    ;;
esac

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

case "$target" in
    "msm8960" | "msm8660" | "msm7630_surf")
        echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout
        ;;
    "msm7627a")
        echo 10 > /sys/devices/platform/msm_sdcc.1/idle_timeout
        ;;
esac

# Post-setup services
case "$target" in
    "msm8660" | "msm8960" | "msm8226" | "msm8610")
        start mpdecision
    ;;
    "msm8974")
        rm /data/system/perfd/default_values
        start mpdecision
        echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
    ;;
    "apq8084")
        rm /data/system/perfd/default_values
        start mpdecision
        echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
        echo 512 > /sys/block/sda/bdi/read_ahead_kb
        echo 512 > /sys/block/sdb/bdi/read_ahead_kb
        echo 512 > /sys/block/sdc/bdi/read_ahead_kb
        echo 512 > /sys/block/sdd/bdi/read_ahead_kb
        echo 512 > /sys/block/sde/bdi/read_ahead_kb
        echo 512 > /sys/block/sdf/bdi/read_ahead_kb
        echo 512 > /sys/block/sdg/bdi/read_ahead_kb
        echo 512 > /sys/block/sdh/bdi/read_ahead_kb
    ;;
    "msm7627a")
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "127" | "128" | "129")
                start mpdecision
        ;;
        esac
    ;;
esac

# Enable Power modes and set the CPU Freq Sampling rates
case "$target" in
     "msm7627a")
        start qosmgrd
    echo 1 > /sys/module/pm2/modes/cpu0/standalone_power_collapse/idle_enabled
    echo 1 > /sys/module/pm2/modes/cpu1/standalone_power_collapse/idle_enabled
    echo 1 > /sys/module/pm2/modes/cpu0/standalone_power_collapse/suspend_enabled
    echo 1 > /sys/module/pm2/modes/cpu1/standalone_power_collapse/suspend_enabled
    #SuspendPC:
    echo 1 > /sys/module/pm2/modes/cpu0/power_collapse/suspend_enabled
    #IdlePC:
    echo 1 > /sys/module/pm2/modes/cpu0/power_collapse/idle_enabled
    echo 25000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
    ;;
esac

# Change adj level and min_free_kbytes setting for lowmemory killer to kick in
case "$target" in
     "msm7627a")
    echo 0,1,2,4,9,12 > /sys/module/lowmemorykiller/parameters/adj
    echo 5120 > /proc/sys/vm/min_free_kbytes
     ;;
esac

# Install AdrenoTest.apk if not already installed
#if [ -f /data/prebuilt/AdrenoTest.apk ]; then
#    if [ ! -d /data/data/com.qualcomm.adrenotest ]; then
#        pm install /data/prebuilt/AdrenoTest.apk
#    fi
#fi

# Change adj level and min_free_kbytes setting for lowmemory killer to kick in
case "$target" in
     "msm8660")
        start qosmgrd
        echo 0,1,2,4,9,12 > /sys/module/lowmemorykiller/parameters/adj
        echo 5120 > /proc/sys/vm/min_free_kbytes
     ;;
esac

case "$target" in
    "msm8226" | "msm8974" | "msm8610" | "apq8084" | "mpq8092" | "msm8610")
        # Let kernel know our image version/variant/crm_version
        image_version="10:"
        image_version+=`getprop ro.build.id`
        image_version+=":"
        image_version+=`getprop ro.build.version.incremental`
        image_variant=`getprop ro.product.name`
        image_variant+="-"
        image_variant+=`getprop ro.build.type`
        oem_version=`getprop ro.build.version.codename`
        echo 10 > /sys/devices/soc0/select_image
        echo $image_version > /sys/devices/soc0/image_version
        echo $image_variant > /sys/devices/soc0/image_variant
        echo $oem_version > /sys/devices/soc0/image_crm_version
        ;;
esac
