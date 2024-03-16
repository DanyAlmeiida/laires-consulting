<form action="{{ $actionUrl ?? RealEstateHelper::getProjectsListPageUrl() }}" class="search-filter search-ajax-item" data-ajax-url="{{ $ajaxUrl ?? route('public.projects') }}">
    <input type="hidden" name="type" value="project">
    <div class="space-y-5 registration-form text-dark text-start">
        <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 lg:gap-0">
            {!! Theme::partial('filters.keyword', compact('type')) !!}

            {!! Theme::partial('filters.location', compact('type')) !!}
        </div>

        <button type="button" class="flex items-center gap-2 toggle-advanced-search text-primary hover:text-secondary">
            {{ __('Advanced') }}
            <i class="mdi mdi-chevron-down-circle-outline"></i>
        </button>

        <div class="grid hidden grid-cols-1 gap-6 transition-all duration-200 ease-in-out lg:grid-cols-3 md:grid-cols-2 lg:gap-0 advanced-search">
            {!! Theme::partial('filters.category', compact('type', 'categories')) !!}

            {!! Theme::partial('filters.prices') !!}
        </div>

        <div class="grid items-center grid-cols-3 gap-2 md:flex md:flex-wrap">
            <button type="submit" class="col-span-2 btn bg-primary hover:bg-secondary border-primary hover:border-secondary text-white submit-btn w-full md:w-1/4 !h-12 rounded transition-all ease-in-out duration-200">
                <i class="mdi mdi-magnify me-2"></i>
                {{ __('Search') }}
            </button>

            <button type="button" class="col-span-1 md:mt-0 w-full md:w-fit px-4 bg-slate-500 rounded text-white py-[0.70rem] hover:bg-slate-600 reset-filter hidden">
                <i class="me-1 mdi mdi-refresh"></i>
                {{ __('Reset') }}
            </button>
        </div>
    </div>
</form>
