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
            - text: "Nuevo Empleado"
        navigate:
          - SUCCESS: check_address
    - check_address:
        do:
          check_availability:
            - address
        navigate:
          - AVAILABLE: print_finish
          - UNAVAILABLE: print_fail
        publish:
          - availability: ${available}
    - print_finish:
        do:
          base.print:
            - text: "${'Availability for address ' + address + ' is: ' + availability}"
        navigate:
          - SUCCESS: SUCCESS
    - on_failure:
      - print_fail:
          do:
            base.print:
              - text: "${'Failed to create address: ' + address}"
  results:
      - SUCCESS
      - FAILURE