<?php

namespace App\Orchid\Resources\Administration;

use Orchid\Screen\TD;
use Orchid\Crud\Resource;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Fields\TextArea;


class Permission extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\Administration\Permission::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'name';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'name',
        'resource'
    ];
    public static $globallySearchable = false;

    /**
     * Get the fields displayed by the resource.
     *
     * @return array
     */
    public function fields(): array
    {
        return [
            Select::make('resource')
                ->required()
                ->options(\App\Models\Administration\Permission::$PERMISSIONABLE),
            TextArea::make('name'),
            // Boolean::make('create'),
            // Boolean::make('view'),
            // Boolean::make('update'),
            // Boolean::make('delete'),
            // BelongsToMany::make('Roles', 'roles'),
        ];
    }

    /**
     * Get the columns displayed by the resource.
     *
     * @return TD[]
     */
    public function columns(): array
    {
        return [
            TD::make('id'),

            TD::make('created_at', 'Date of creation')
                ->render(function ($model) {
                    return $model->created_at->toDateTimeString();
                }),

            TD::make('updated_at', 'Update date')
                ->render(function ($model) {
                    return $model->updated_at->toDateTimeString();
                }),
        ];
    }

    /**
     * Get the sights displayed by the resource.
     *
     * @return Sight[]
     */
    public function legend(): array
    {
        return [];
    }

    /**
     * Get the filters available for the resource.
     *
     * @return array
     */
    public function filters(): array
    {
        return [];
    }
}
