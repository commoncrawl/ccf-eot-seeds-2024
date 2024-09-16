import csv
import fileinput


fed_csv = set()
with open('current-federal.csv', newline='') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        fed_csv.add(row[0])

def main():
    for line in fileinput.input():  # host-gov
        parts = line.strip().split('\t')
        rhost = parts[4]
        host = '.'.join(reversed(list(x for x in rhost.split('.'))))
        last_two = '.'.join(host.split('.')[-2:])
        if last_two in fed_csv:
            print(host)

if __name__ == '__main__':
    main()
