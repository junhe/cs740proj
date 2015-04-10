import subprocess
import pprint
import flowTableParser

def dump_table():
    cmd = 'echo 888888'.split()
    proc = subprocess.Popen(cmd, stdout=open('/tmp/_flowtmp','w'))
    proc.wait()

    for line in open('/tmp/_flowtmp','r'):
        print line


def main():
    # dump_table()
    f = open('./openflowdump-sample.log', 'r')
    text = f.readlines()

    tab = flowTableParser.text2table(text)
    pprint.pprint( tab )


if __name__ == '__main__':
    main()


