import subprocess
import pprint
import flowTableParser

def dump_table():
    cmd = 'sudo ovs-ofctl dump-flows br0'.split()
    proc = subprocess.Popen(cmd, stdout=open('/tmp/_flowtmp','w'))
    proc.wait()

    f = open('/tmp/_flowtmp','r')
    return f.readlines()

def main():
    linelist = dump_table()
    # f = open('./openflowdump-sample.log', 'r')
    # linelist = f.readlines()

    tab = flowTableParser.text2table(linelist)
    pprint.pprint( tab )

if __name__ == '__main__':
    main()


