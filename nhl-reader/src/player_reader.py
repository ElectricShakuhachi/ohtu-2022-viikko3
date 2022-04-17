import requests
from player import Player

class PlayerReader:
    def __init__(self, url):
        self.url = url
        self._players = []
        self.read_players(self.url)

    def read_players(self, url):
        response = requests.get(url).json()
        for player_dict in response:
            player = Player(
                player_dict['name'],
                player_dict['nationality'],
                player_dict['assists'],
                player_dict['goals'],
                player_dict['penalties'],
                player_dict['team'],
                player_dict['games'],
            )
            self.players.append(player)

    @property
    def players(self):
        return self._players
