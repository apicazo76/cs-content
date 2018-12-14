namespace: Tutorials.Hiring

operation:
  name: check_availability

  inputs:
    - address

  python_action:
    script: |
      import random
      rand = random.randint(0, 2)
      vacant = rand != 0
      #print rand

  outputs:
    - available: ${str(vacant)}

  results:
    - UNAVAILLE: ${rand == 0}
    - AVAILABLE: ${rand == 1}
    - ILLEGAL