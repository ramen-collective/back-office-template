<?php

namespace App\Models\Administration;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Role extends Model
{
    use hasFactory;
    protected $table = 'role';


    protected $attributes = [
        'id',
        'name'
    ];


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'name',
        'slug'
    ];

    protected $cast = [];

    protected $allowedFilters = [];

    /** Fetch associated users. */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_role');
    }

    /** Fetch associated permissions. */
    public function permissions(): BelongsToMany
    {
        return $this->belongsToMany(Permission::class, 'role_permission');
    }
}
