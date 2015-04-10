from pyparsing import *

def text2table(linelist):
    num = Word(nums)
    actionname = Word(printables)
    octnum = Word("0x"+hexnums)
    realnum = Word(nums+".").setParseAction( lambda tokens: float(tokens[0]) )
    intnum = Word(nums).setParseAction( lambda tokens: int(tokens[0]) )

    row = "cookie="+octnum.setResultsName('cookie')+','\
            +'duration='+realnum.setResultsName('duration')+'s,'\
            +'table='+intnum.setResultsName('table')+','\
            +'n_packets='+intnum.setResultsName('n_packets')+','\
            +'n_bytes='+intnum.setResultsName('n_bytes')+','\
            +'idle_age='+intnum.setResultsName('idle_age') +','\
            +'priority='+intnum.setResultsName('priority') \
            +'actions='+actionname.setResultsName('actions')

    table = []
    for line in linelist:
        if not line.startswith(' cookie='):
            continue
        rowresult = row.parseString(line)
        # print rowresult.dump()
        table.append( dict(rowresult) )

    return table

# f = open('./openflowdump-sample.log', 'r')
# text = f.readlines()

# tab = text2table(text)
# pprint.pprint( tab )

