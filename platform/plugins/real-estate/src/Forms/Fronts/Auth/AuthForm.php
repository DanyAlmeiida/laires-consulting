<?php

namespace Botble\RealEstate\Forms\Fronts\Auth;

use Botble\Base\Forms\FormAbstract;
use Botble\RealEstate\Forms\Fronts\Auth\Concerns\HasSubmitButton;
use Botble\Theme\Facades\Theme;

abstract class AuthForm extends FormAbstract
{
    use HasSubmitButton;

    public function setup(): void
    {
        Theme::asset()->add('auth-css', 'vendor/core/plugins/real-estate/css/front-auth.css');

        $this
            ->contentOnly()
            ->template('plugins/real-estate::forms.auth');
    }

    public function banner(string $banner): static
    {
        return $this->setFormOption('banner', $banner);
    }

    public function icon(string $icon): static
    {
        return $this->setFormOption('icon', $icon);
    }

    public function heading(string $heading): static
    {
        return $this->setFormOption('heading', $heading);
    }

    public function description(string $description): static
    {
        return $this->setFormOption('description', $description);
    }
}
