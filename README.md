# ccf-eot-seeds-2024

Code used to generate some of the "seed lists" used for the [End of
Term Web Archive 2024 crawl](https://github.com/end-of-term/eot2024/).

## Install

`pip install -r requirements.txt`

## 2024 recipes

### make get-csvs

Downloads 2 csvs from get.gov, listing all of the federal and
non-federal domains registered in the .gov tld.

### make get-webgraph

Download [web graph](https://commoncrawl.org/web-graphs) summaries from CCF, as tab-separated values (tsv).

### make make-subsets

Given web graph domain and host ranks, grep out
the .mil and .gov domains therein. Output is
still the web graph table tsv format.

### make hosts-to-seed

Take current-federal.csv plus the hosts webgraph, and output all .gov
hosts whose domains are in current-federal.csv. For .mil hosts, output
all hosts. This output is what is checked into eot2024/seed-lists.

- ccf-gov-federal-web-graph-2024-jun-jul-aug.txt
- ccf-mil-web-graph-2024-jun-jul-aug.txt
