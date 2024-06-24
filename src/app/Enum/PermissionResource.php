<?php

namespace App\Enum;

enum PermissionResource: string
{
    case ADMIN_ACTIVITY_LOG = 'Administration/ActivityLog';
    case ADMIN_PERMISSION = 'Administration/Permission';
    case ADMIN_ROLE = 'Administration/Role';
    case ADMIN_USER = 'Administration/User';
    // const CATALOG_AUTHOR = 'Catalog/Author';
    // const CATALOG_COLLECTION = 'Catalog/Collection';
    // const CATALOG_CONTENT = 'Catalog/Content';
    // const CATALOG_TAG = 'Catalog/Tag';
    // const CLIENTS_SUBSCRIPTION = 'Clients/Subscription';
    // const CLIENTS_SUBSCRIPTION_HISTORY = 'Clients/SubscriptionHistory';
    // const GIFTCODES_CAMPAIGN = 'Giftcodes/Campaign';
    // const GIFTCODES_PARTNER = 'Giftcodes/Partner';
    // const JOBS_AUDIO_DURATION = 'Jobs/AudioDuration';
    // const JOBS_ENCODING_MEDIA = 'Jobs/EncodingMediaJob';
    // const JOBS_VIDEO_DURATION = 'Jobs/VideoDuration';
    // const MEDIAS_AUDIO_MEDIA = 'Medias/AudioMedia';
    // const MEDIAS_COVER_MEDIA = 'Medias/CoverMedia';
    // const MEDIAS_VIDEO_MEDIA = 'Medias/VideoMedia';
}
