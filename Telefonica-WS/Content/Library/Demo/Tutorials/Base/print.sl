namespace: Tutorials.Base
operation:
  name: print
  inputs:
    - text
  python_action:
    script: print text
  outputs:
    - textouput: ${str(text)}
  results:
    - SUCCESS