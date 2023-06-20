# *******************
# DE TEXTO A MARKDOWN
# *******************
import filecmp
from pathlib import Path


def run(text_path: Path) -> bool:
    data = ""
    md_element = "#"

    with open (text_path, "r") as first_text:
        title = first_text.readline().strip()
        data += f'# {title}\n'
        for line in first_text:
            tab_count = line.count("\t")
            first_element = md_element * tab_count
            text = line.strip()
            data += f'#{first_element} {text}\n'

    md_path =  'data/txt2md/outline.md'
    with open(md_path, "w") as result:
        result.write(data)


            
            

    return filecmp.cmp(md_path, 'data/txt2md/.expected', shallow=False)


if __name__ == '__main__':
    run('data/txt2md/outline.txt')