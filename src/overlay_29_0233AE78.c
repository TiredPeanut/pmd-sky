#include "overlay_29_0233AE78.h"

enum terrain_type GetTileTerrain(struct tile *tile)
{
    return (enum terrain_type)(tile->terrain_flags & 3);
}
