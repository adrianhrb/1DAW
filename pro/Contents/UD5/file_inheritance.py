class File:
    def __init__(self, path: str):
        self.path = path
        self.contents = []

    def add_contents(self, contents: str):
        self.contents.append(contents)

    @property
    def size(self):
        return sum(len(content) for content in self.contents)

    def info(self):
        return f"{self.path} [size={self.size}B]\n"


class MediaFile(File):
    def __init__(self, path: str, codec: str, geoloc: tuple, duration: int):
        super().__init__(path)
        self.codec = codec
        self.geoloc = geoloc
        self.duration = duration

    def info(self):
        return (
            super().info()
            + f"Codec: {self.codec}\nGeolocalization: {self.geoloc}\nDuration: {self.duration}\n"
        )


class VideoFile(MediaFile):
    def __init__(
        self, path: str, codec: str, geoloc: tuple, duration: int, dimensions: tuple
    ):
        super().__init__(path, codec, geoloc, duration)
        self.dimensions = dimensions

    def info(self):
        return super().info() + f"Dimensions: {self.dimensions}"


prueba = VideoFile(
    "/home/python/vanrossum.mp4", "h264", (23.5454, 31.4343), 487, (1920, 1080)
)
prueba.add_contents("audio/ogg")
prueba.add_contents("video/webm")

print(prueba.info())
