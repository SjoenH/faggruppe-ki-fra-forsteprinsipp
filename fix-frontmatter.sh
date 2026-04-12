#!/bin/bash
# Fixer blanke linjer foran layout:/class: i Slidev frontmatter
python3 -c "
import re, sys
with open('slides.md', 'r') as f:
    content = f.read()
fixed, n = re.subn(r'---\n\n(layout:|class:)', r'---\n\1', content)
with open('slides.md', 'w') as f:
    f.write(fixed)
print(f'Fikset {n} frontmatter-blokker')
"
