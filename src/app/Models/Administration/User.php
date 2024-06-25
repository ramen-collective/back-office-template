<?php

namespace App\Models\Administration;

use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements FilamentUser
{
    protected $table = 'user';
    protected $primaryKey = 'uuid';
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at'    => 'datetime',
    ];

    protected $allowedFilters = [
    ];

    protected $allowedSorts = [
        'uuid',
        'name',
        'email',
        'updated_at',
        'created_at',
    ];

    public function canAccessPanel(Panel $panel): bool
    {
        return str_ends_with($this->email, '@gmail.com') && !$this->hasVerifiedEmail();
    }


    /**
     * Get the roles associated with the user.
     */
    // public function roles(): BelongsToMany
    // {
    //     return $this->belongsToMany(Role::class, 'user_role');
    // }
}
