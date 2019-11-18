import kotlinx.serialization.Serializable

@Serializable
data class ResultArtist constructor(
    val resultCount: String,
    val results: List<ResultObjectList>
)

@Serializable
data class ResultObjectList constructor(
    val artistName: String
)
