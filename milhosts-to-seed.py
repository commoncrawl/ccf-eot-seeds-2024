import fileinput


def main():
    for line in fileinput.input():  # host-mil
        parts = line.strip().split('\t')
        rhost = parts[4]
        host = '.'.join(reversed(list(x for x in rhost.split('.'))))
        print(host)

if __name__ == '__main__':
    main()
