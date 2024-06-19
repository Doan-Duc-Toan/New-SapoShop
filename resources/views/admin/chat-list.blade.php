@if ($conversations)
    @foreach ($conversations as $conversation)
        <li class="clearfix conversation-item {{ $conversation->user_seen ? '' : 'not-seen' }}"
            data-conversation-id ="{{ $conversation->id }}">
            <img src="{{ asset('img/user.png') }}" alt="avatar">
            <div class="about">
                <div class="name">{{ $conversation->customer->fullname }}</div>
                <div class="status"> <i class="fa fa-circle online"></i> online </div>
            </div>
        </li>
    @endforeach
@endif
