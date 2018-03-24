from i3pystatus import IntervalModule
from i3pystatus.core.util import internet, require

from decimal import Decimal

import requests

import json

NICEHASH_API_URL = 'https://api.nicehash.com/api?method=stats.provider.ex&addr={address}'

class NiceHash(IntervalModule):

    settings = (
        ('address', 'NiceHash bitcoin address to use for API calls'),
    )

    address = ''
    interval = 120
    format = '{btc_per_day} Ƀ/day'

    def run(self):

        try:
            response = requests.get(NICEHASH_API_URL.format(address=self.address), timeout=10)

            if response.text:

                data = response.json()

                current_algos = data['result']['current']

                profit_per_day = Decimal(0)
                for algo in current_algos:

                    speed = algo['data'][0].get('a')
                    if speed:
                        profit_per_day += Decimal(float(speed)) * Decimal(float(algo['profitability']))

                self.logger.error(profit_per_day)

                self.data = {
                    'btc_per_day': format(profit_per_day, '.4f'),
                }

            else:

                self.data = {
                    'btc_per_day': 'NA',
                }            

        except Exception as e:
            self.logger.critical(e)

            self.data = {
                'btc_per_day': 'NA',
            }


        self.output = {
            'full_text': self.format.format(**self.data)
        }