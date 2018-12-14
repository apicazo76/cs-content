namespace: Tutorials.Hiring
imports:
  base: Tutorials.Base
flow:
  name: new_hire
  inputs:
    - address
  workflow:
    - print_start:
        do:
          base.print:
            - text: Nuevo Empleado
        navigate:
          - SUCCESS: check_address
    - check_address:
        do:
          check_availability:
            - address
        publish:
          - availability: '${available}'
        navigate:
          - AVAILABLE: print_finish
          - UNAVAILABLE: print_fail
    - print_finish:
        do:
          base.print:
            - text: "${'Availability for address ' + address + ' is: ' + availability}"
        navigate:
          - SUCCESS: SUCCESS
    - print_fail:
        do:
          base.print:
            - text: "${'Failed to create address: ' + address}"
        navigate:
          - SUCCESS: FAILURE
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      print_start:
        x: 100
        y: 250
      check_address:
        x: 400
        y: 250
      print_finish:
        x: 700
        y: 125
        navigate:
          14bbb425-853b-9bf0-75e5-c8bcaa41dad3:
            targetId: de218cfd-a525-f1fe-bb05-b499d5e60584
            port: SUCCESS
      print_fail:
        x: 700
        y: 375
        navigate:
          8fe896a6-5b63-5ef6-a217-2a28004810d2:
            targetId: 0d2e5c03-84ba-3755-802a-62a92da4b156
            port: SUCCESS
    results:
      SUCCESS:
        de218cfd-a525-f1fe-bb05-b499d5e60584:
          x: 1000
          y: 250
      FAILURE:
        0d2e5c03-84ba-3755-802a-62a92da4b156:
          x: 880
          y: 390
