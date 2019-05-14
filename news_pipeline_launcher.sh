#!/bin/bash
redis-server &
sudo mongod &

pip install -r requirements.txt

# cd news_topic_modeling_service/server
# python server.py &



# cd ../../news_pipeline
cd news_pipeline
python news_monitor.py &
python news_fetcher.py &
python news_deduper.py &

echo "=================================================="
read -p "PRESS [ANY KEY] TO TERMINATE PROCESSES." PRESSKEY

kill $(jobs -p)
