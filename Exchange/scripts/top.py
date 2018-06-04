# coding: utf-8
from unipath import Path
import sys
import os

PROJECT_DIR = Path(os.path.abspath(__file__)).parent.parent
sys.path.append(PROJECT_DIR)
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'exchange.settings')

import django
from django.utils import timezone
django.setup()

from twisted.internet import task
from twisted.internet import reactor
from general import crawlers

def main():
	crawler = (crawlers.NewCrawlers(), 5)
	task.LoopingCall(crawler[0].run).start(crawler[1])
	reactor.run()

if __name__ == '__main__':
	main()