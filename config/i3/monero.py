from i3pystatus import IntervalModule
from i3pystatus.core.util import internet, require

from decimal import Decimal

import requests

import json

XMRSUPPORT_STATS_URL = 'https://supportxmr.com/api/miner/{address}/stats'

class Monero(IntervalModule):

    settings = (
        ('address', 'Monero address to use for API calls'),
    )

    address = ''
    interval = 30 
    display_format = '{} KH/s'

    def run(self):

        try:
            response = requests.get(XMRSUPPORT_STATS_URL.format(address=self.address), timeout=10)

            if response.text:

                data = response.json()

                hash_mh = data['hash']
                hash_kh = "{0:.2f}".format(hash_mh / 1024)

                self.data = {
                    'hash_rate': hash_kh,
                }

            else:

                self.data = {
                    'hash_rate': 'NA',
                }

        except Exception as e:
            self.logger.critical(e)

            self.data = {
                'hash_rate': 'NA',
            }


        self.output = {
            'full_text': self.display_format.format(self.data['hash_rate'])
        }
