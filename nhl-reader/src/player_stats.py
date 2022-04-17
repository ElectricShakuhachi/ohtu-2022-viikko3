class PlayerStats:
    def __init__(self,reader):
        self.reader = reader

    def top_scorers_by_nationality(self, nationality):
        return [player for player in self.reader.players if player.nationality == nationality]
 