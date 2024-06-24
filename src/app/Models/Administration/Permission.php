<?php

namespace App\Models\Administration;

use App\Enum\PermissionResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Permission extends Model
{
    use HasFactory;

    public static $PERMISSIONABLE = [
        PermissionResource::ADMIN_ACTIVITY_LOG->value => PermissionResource::ADMIN_ACTIVITY_LOG->value,
        PermissionResource::ADMIN_PERMISSION->value => PermissionResource::ADMIN_PERMISSION->value,
        PermissionResource::ADMIN_ROLE->value => PermissionResource::ADMIN_ROLE->value,
        PermissionResource::ADMIN_USER->value => PermissionResource::ADMIN_USER->value,
        // PermissionResource::CATALOG_AUTHOR => PermissionResource::CATALOG_AUTHOR,
        // PermissionResource::CATALOG_COLLECTION => PermissionResource::CATALOG_COLLECTION,
        // PermissionResource::CATALOG_CONTENT => PermissionResource::CATALOG_CONTENT,
        // PermissionResource::CATALOG_TAG => PermissionResource::CATALOG_TAG,
        // PermissionResource::CLIENTS_SUBSCRIPTION => PermissionResource::CLIENTS_SUBSCRIPTION,
        // PermissionResource::CLIENTS_SUBSCRIPTION_HISTORY => PermissionResource::CLIENTS_SUBSCRIPTION_HISTORY,
        // PermissionResource::GIFTCODES_CAMPAIGN => PermissionResource::GIFTCODES_CAMPAIGN,
        // PermissionResource::GIFTCODES_PARTNER => PermissionResource::GIFTCODES_PARTNER,
        // PermissionResource::JOBS_AUDIO_DURATION => PermissionResource::JOBS_AUDIO_DURATION,
        // PermissionResource::JOBS_ENCODING_MEDIA => PermissionResource::JOBS_ENCODING_MEDIA,
        // PermissionResource::JOBS_VIDEO_DURATION => PermissionResource::JOBS_VIDEO_DURATION,
        // PermissionResource::MEDIAS_AUDIO_MEDIA => PermissionResource::MEDIAS_AUDIO_MEDIA,
        // PermissionResource::MEDIAS_COVER_MEDIA => PermissionResource::MEDIAS_COVER_MEDIA,
        // PermissionResource::MEDIAS_VIDEO_MEDIA => PermissionResource::MEDIAS_VIDEO_MEDIA,
    ];

    protected $table = 'permission';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'role_id',
        'resource',
        'create',
        'delete',
        'update',
        'view',
    ];

    /**
     * Get the role associated with the permission.
     */
    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class, 'role_permission');
    }
}
