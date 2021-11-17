#!/bin/bash
trap 'rm -f "$TMPFILE"' EXIT

function delay(){ sleep 0.1; }

CHECK_STATUS_FILE=$(mktemp) || exit 1
START_FROM_FILE=$(mktemp) || exit 1
echo "0" 1>$CHECK_STATUS_FILE
echo "0" 1>$START_FROM_FILE

function bar_continue(){
    echo "1" 1>$CHECK_STATUS_FILE
    wait
    echo -ne '                                                                             \r'
}

function bar_start_from(){
    echo "$1" 1>$START_FROM_FILE
    echo "0" 1>$CHECK_STATUS_FILE
}

function bar_hold_at(){
    custom_progress=$1;
    custom_phase=$2;
    num=0
    postfix=('|' '/' '-' '\')
    read check_start_from <$START_FROM_FILE
    read check_status <$CHECK_STATUS_FILE
    # check_status1 0

    while [ $check_start_from -le 0 -a $custom_progress -ge 0 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [..........................] (0%)" "$custom_phase"
        let num++
        sleep 0.1
        if [ $custom_progress -gt 0 ]; then
            let check_start_from=5
            break
        elif [ "$check_status" = "1" ]; then
            echo "5" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 5 -a $custom_progress -ge 5 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#.........................] (5%)" "$custom_phase"
        let num++
        sleep 0.1
        if [ $custom_progress -gt 5 ]; then
            let check_start_from=10
            break
        elif [ "$check_status" = "1" ]; then
            echo "10" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 10 -a $custom_progress -ge 10 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [##........................] (10%)" "$custom_phase"
        let num++
        sleep 0.1
        if [ $custom_progress -gt 10 ]; then
            let check_start_from=15
            break
        elif [ "$check_status" = "1" ]; then
            echo "15" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 15 -a $custom_progress -ge 15 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [###.......................] (15%)" "$custom_phase"
        let num++
        sleep 0.1
        if [ $custom_progress -gt 15 ]; then
            let check_start_from=20
            break
        elif [ "$check_status" = "1" ]; then
            echo "20" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 20 -a $custom_progress -ge 20 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [####......................] (20%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 20 ]; then
            let check_start_from=25
            break
        elif [ "$check_status" = "1" ]; then
            echo "25" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 25 -a $custom_progress -ge 25 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#####.....................] (25%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 25 ]; then
            let check_start_from=30
            break
        elif [ "$check_status" = "1" ]; then
            echo "30" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 30 -a $custom_progress -ge 30 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [######....................] (30%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 30 ]; then
            let check_start_from=35
            break
        elif [ "$check_status" = "1" ]; then
            echo "35" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 35 -a $custom_progress -ge 35 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#######...................] (35%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 35 ]; then
            let check_start_from=40
            break
        elif [ "$check_status" = "1" ]; then
            echo "40" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 40 -a $custom_progress -ge 40 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [########..................] (40%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 40 ]; then
            let check_start_from=45
            break
        elif [ "$check_status" = "1" ]; then
            echo "45" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 45 -a $custom_progress -ge 45 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#########.................] (45%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 45 ]; then
            let check_start_from=50
            break
        elif [ "$check_status" = "1" ]; then
            echo "50" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 50 -a $custom_progress -ge 50 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [##########................] (50%) " "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 50 ]; then
            let check_start_from=55
            break
        elif [ "$check_status" = "1" ]; then
            echo "55" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 55 -a $custom_progress -ge 55 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [###########...............] (55%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 55 ]; then
            let check_start_from=60
            break
        elif [ "$check_status" = "1" ]; then
            echo "60" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 60 -a $custom_progress -ge 60 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [############..............] (60%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 60 ]; then
            let check_start_from=65
            break
        elif [ "$check_status" = "1" ]; then
            echo "65" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 65 -a $custom_progress -ge 65 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#############.............] (65%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 65 ]; then
            let check_start_from=70
            break
        elif [ "$check_status" = "1" ]; then
            echo "70" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 70 -a $custom_progress -ge 70 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [##############............] (70%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 70 ]; then
            let check_start_from=75
            break
        elif [ "$check_status" = "1" ]; then
            echo "75" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 75 -a $custom_progress -ge 75 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [################..........] (75%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 75 ]; then
            let check_start_from=80
            break
        elif [ "$check_status" = "1" ]; then
            echo "80" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 80 -a $custom_progress -ge 80 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [###################.......] (80%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 80 ]; then
            let check_start_from=85
            break
        elif [ "$check_status" = "1" ]; then
            echo "85" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 85 -a $custom_progress -ge 85 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#####################.....] (85%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 85 ]; then
            let check_start_from=90
            break
        elif [ "$check_status" = "1" ]; then
            echo "90" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 90 -a $custom_progress -ge 90 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [#######################...] (90%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 95 ]; then
            let check_start_from=95
            break
        elif [ "$check_status" = "1" ]; then
            echo "95" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    while [ $check_start_from -le 95 -a $custom_progress -ge 95 ]
    do
        let index=num%4
        printf "%-31s %-50s \r" "[ ${postfix[$index]} ] [########################..] (95%)" "$custom_phase"
        let num++
        sleep 0.1
        read check_status <$CHECK_STATUS_FILE
        if [ $custom_progress -gt 95 ]; then
            let check_start_from=100
            break
        elif [ "$check_status" = "1" ]; then
            echo "100" 1>$START_FROM_FILE
            exit 0
        else
            continue
        fi
    done

    if [ $check_start_from -le 100 -a $custom_progress -ge 100 ]; then echo -ne "[ - ] [##########################] (100%) $custom_phase \r" ; delay; fi;
    if [ $check_start_from -le 100 -a $custom_progress -ge 100 ];then echo -ne 'done!                                                                               \r' ; delay; fi;
}