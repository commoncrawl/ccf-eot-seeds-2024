install:
	pip install -r requirements.txt

get-csvs:
	wget https://raw.githubusercontent.com/cisagov/dotgov-data/main/current-federal.csv
	wget https://raw.githubusercontent.com/cisagov/dotgov-data/main/current-full.csv

get-webgraph:
	wget https://data.commoncrawl.org/projects/hyperlinkgraph/cc-main-2024-jun-jul-aug/host/cc-main-2024-jun-jul-aug-host-ranks.txt.gz
	wget https://data.commoncrawl.org/projects/hyperlinkgraph/cc-main-2024-jun-jul-aug/domain/cc-main-2024-jun-jul-aug-domain-ranks.txt.gz

get-old-webgraph:
	wget https://data.commoncrawl.org/projects/hyperlinkgraph/cc-main-2024-feb-apr-may/host/cc-main-2024-feb-apr-may-host-ranks.txt.gz
	wget https://data.commoncrawl.org/projects/hyperlinkgraph/cc-main-2024-feb-apr-may/domain/cc-main-2024-feb-apr-may-domain-ranks.txt.gz

make-subsets:
	zcat cc-main-2024-jun-jul-aug-host-ranks.txt.gz | fgrep $$'\tgov.' > host-gov
	zcat cc-main-2024-jun-jul-aug-host-ranks.txt.gz | fgrep $$'\tmil.' > host-mil
	zcat cc-main-2024-jun-jul-aug-domain-ranks.txt.gz | fgrep $$'\tmil.' > domain-mil
	zcat cc-main-2024-jun-jul-aug-domain-ranks.txt.gz | fgrep $$'\tgov.' > domain-gov

make-old-subsets:
	zcat cc-main-2024-feb-apr-may-host-ranks.txt.gz | fgrep $$'\tgov.' > host-gov-old
	zcat cc-main-2024-feb-apr-may-host-ranks.txt.gz | fgrep $$'\tmil.' > host-mil-old
	zcat cc-main-2024-feb-apr-may-domain-ranks.txt.gz | fgrep $$'\tmil.' > domain-mil-old
	zcat cc-main-2024-feb-apr-may-domain-ranks.txt.gz | fgrep $$'\tgov.' > domain-gov-old

hosts-to-seed:
	python ./hosts-to-seed.py host-gov > ccf-gov-federal-web-graph-2024-jun-jul-aug.txt
	python ./milhosts-to-seed.py host-mil > ccf-mil-web-graph-2024-jun-jul-aug.txt
