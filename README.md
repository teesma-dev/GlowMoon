<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Glow Moon — Your Cycle, Your Rhythm</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400;1,600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --pink:      #E91E8C;
      --pink-deep: #C2185B;
      --pink-soft: #FF80BC;
      --pink-pale: #FFF0F7;
      --pink-mid:  #FFD6EB;
      --rose:      #FF4081;
      --teal:      #4ECDC4;
      --green:     #6BC97E;
      --lavender:  #C77DFF;
      --bg:        #FFF8FB;
      --surface:   #FFFFFF;
      --border:    rgba(233,30,140,0.12);
      --text:      #1A0A12;
      --muted:     #8A7080;
    }

    html { scroll-behavior: smooth; }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--bg);
      color: var(--text);
      overflow-x: hidden;
    }

    /* ── ANIMATED BG ── */
    .blob-bg {
      position: fixed;
      inset: 0;
      pointer-events: none;
      z-index: 0;
      overflow: hidden;
    }
    .blob-bg::before, .blob-bg::after {
      content: '';
      position: absolute;
      border-radius: 50%;
      filter: blur(80px);
      opacity: 0.22;
      animation: drift 18s ease-in-out infinite alternate;
    }
    .blob-bg::before {
      width: 600px; height: 600px;
      background: radial-gradient(circle, #E91E8C, #FF80BC);
      top: -200px; right: -150px;
    }
    .blob-bg::after {
      width: 500px; height: 500px;
      background: radial-gradient(circle, #C77DFF, #4ECDC4);
      bottom: -150px; left: -100px;
      animation-delay: -9s;
    }
    @keyframes drift {
      from { transform: translate(0, 0) scale(1); }
      to   { transform: translate(40px, 30px) scale(1.08); }
    }

    /* ── HERO ── */
    .hero {
      position: relative;
      z-index: 1;
      text-align: center;
      padding: 90px 24px 70px;
    }

    .moon-icon {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 100px;
      height: 100px;
      border-radius: 26px;
      background: linear-gradient(135deg, #FFF0F7, #FFD6EB);
      border: 2px solid rgba(233,30,140,0.18);
      box-shadow: 0 8px 48px rgba(233,30,140,0.22), 0 2px 8px rgba(0,0,0,0.06);
      margin: 0 auto 32px;
      font-size: 52px;
      animation: glow-pulse 3s ease-in-out infinite;
    }
    @keyframes glow-pulse {
      0%, 100% { box-shadow: 0 8px 48px rgba(233,30,140,0.22), 0 2px 8px rgba(0,0,0,0.06); }
      50%       { box-shadow: 0 12px 64px rgba(233,30,140,0.40), 0 2px 16px rgba(0,0,0,0.08); }
    }

    .hero-badge {
      display: inline-block;
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      color: var(--pink);
      background: rgba(233,30,140,0.08);
      border: 1px solid rgba(233,30,140,0.22);
      padding: 5px 16px;
      border-radius: 100px;
      margin-bottom: 24px;
    }

    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(3.2rem, 9vw, 6.5rem);
      font-weight: 700;
      line-height: 1.05;
      margin-bottom: 20px;
      background: linear-gradient(135deg, #C2185B 0%, #E91E8C 40%, #FF80BC 70%, #C77DFF 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .hero-sub {
      font-family: 'Playfair Display', serif;
      font-size: clamp(1rem, 3vw, 1.4rem);
      font-style: italic;
      color: var(--muted);
      margin-bottom: 18px;
    }

    .hero p {
      font-size: 1.05rem;
      color: var(--muted);
      max-width: 460px;
      margin: 0 auto 44px;
      line-height: 1.75;
      font-weight: 300;
    }

    /* ── BADGES ── */
    .badge-row {
      display: flex;
      gap: 10px;
      justify-content: center;
      flex-wrap: wrap;
      margin-bottom: 40px;
    }
    .tech-badge {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-size: 12px;
      font-weight: 500;
      padding: 6px 14px;
      border-radius: 100px;
      border: 1px solid rgba(233,30,140,0.2);
      background: white;
      color: var(--muted);
    }
    .tech-badge .dot {
      width: 8px; height: 8px; border-radius: 50%;
      flex-shrink: 0;
    }
    .dot-pink   { background: var(--pink); }
    .dot-orange { background: #FF7043; }
    .dot-blue   { background: #29B6F6; }
    .dot-green  { background: var(--green); }

    /* ── BUTTONS ── */
    .btn-row {
      display: flex;
      gap: 14px;
      justify-content: center;
      flex-wrap: wrap;
    }
    .btn {
      display: inline-flex;
      align-items: center;
      gap: 9px;
      padding: 14px 28px;
      border-radius: 14px;
      font-size: 14px;
      font-weight: 600;
      font-family: 'DM Sans', sans-serif;
      text-decoration: none;
      transition: transform 0.18s ease, box-shadow 0.18s ease, filter 0.18s ease;
      cursor: pointer;
      border: none;
    }
    .btn:hover { transform: translateY(-2px); filter: brightness(1.08); }

    .btn-primary {
      background: linear-gradient(135deg, #C2185B, #E91E8C, #FF80BC);
      color: white;
      box-shadow: 0 4px 28px rgba(233,30,140,0.38);
    }
    .btn-github {
      background: white;
      color: var(--text);
      border: 1.5px solid rgba(233,30,140,0.2);
      box-shadow: 0 2px 12px rgba(233,30,140,0.1);
    }
    .btn-coffee {
      background: linear-gradient(135deg, #fd8c00, #ffdd57);
      color: #1a1a1a;
      box-shadow: 0 4px 24px rgba(253,140,0,0.32);
      font-weight: 700;
    }

    /* ── SECTION WRAPPER ── */
    .section {
      position: relative;
      z-index: 1;
      max-width: 920px;
      margin: 0 auto;
      padding: 60px 24px;
    }

    .section-label {
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.16em;
      text-transform: uppercase;
      color: var(--pink);
      text-align: center;
      margin-bottom: 14px;
    }
    .section-title {
      font-family: 'Playfair Display', serif;
      font-size: clamp(1.8rem, 4vw, 2.8rem);
      font-weight: 600;
      text-align: center;
      margin-bottom: 12px;
      color: var(--text);
    }
    .section-desc {
      text-align: center;
      color: var(--muted);
      font-size: 15px;
      line-height: 1.7;
      max-width: 480px;
      margin: 0 auto 48px;
      font-weight: 300;
    }

    /* ── DIVIDER ── */
    .divider {
      position: relative;
      z-index: 1;
      height: 1px;
      background: linear-gradient(90deg, transparent, rgba(233,30,140,0.15), transparent);
      max-width: 920px;
      margin: 0 auto;
    }

    /* ── SCREENSHOTS ── */
    .screenshots-scroll {
      display: flex;
      gap: 20px;
      justify-content: center;
      flex-wrap: wrap;
      align-items: flex-start;
    }
    .phone-frame {
      flex-shrink: 0;
      width: 190px;
      position: relative;
      transition: transform 0.25s ease, box-shadow 0.25s ease;
    }
    .phone-frame:hover {
      transform: translateY(-8px) scale(1.03);
    }
    .phone-frame img {
      width: 100%;
      border-radius: 28px;
      border: 2px solid rgba(233,30,140,0.12);
      box-shadow: 0 16px 48px rgba(233,30,140,0.14), 0 4px 12px rgba(0,0,0,0.08);
      display: block;
    }
    .phone-caption {
      text-align: center;
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.06em;
      color: var(--muted);
      margin-top: 10px;
      text-transform: uppercase;
    }

    /* ── FEATURES ── */
    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 16px;
    }
    .feature-card {
      background: white;
      border: 1px solid var(--border);
      border-radius: 20px;
      padding: 28px 24px;
      position: relative;
      overflow: hidden;
      transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
    }
    .feature-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 12px 40px rgba(233,30,140,0.12);
      border-color: rgba(233,30,140,0.25);
    }
    .feature-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      border-radius: 20px 20px 0 0;
    }
    .fc1::before { background: linear-gradient(90deg, #E91E8C, #FF80BC); }
    .fc2::before { background: linear-gradient(90deg, #4ECDC4, #6BC97E); }
    .fc3::before { background: linear-gradient(90deg, #C77DFF, #E91E8C); }
    .fc4::before { background: linear-gradient(90deg, #FF7043, #FFCC02); }
    .fc5::before { background: linear-gradient(90deg, #29B6F6, #4ECDC4); }
    .fc6::before { background: linear-gradient(90deg, #6BC97E, #C77DFF); }
    .fc7::before { background: linear-gradient(90deg, #FF4081, #FF7043); }
    .fc8::before { background: linear-gradient(90deg, #FFCC02, #E91E8C); }

    .feature-icon {
      font-size: 30px;
      margin-bottom: 14px;
      display: block;
    }
    .feature-card h3 {
      font-size: 15px;
      font-weight: 600;
      margin-bottom: 8px;
      color: var(--text);
    }
    .feature-card p {
      font-size: 13px;
      color: var(--muted);
      line-height: 1.65;
      font-weight: 300;
    }

    /* ── CYCLE LEGEND ── */
    .legend-strip {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 24px;
      flex-wrap: wrap;
      background: white;
      border: 1px solid var(--border);
      border-radius: 16px;
      padding: 20px 32px;
      margin-bottom: 48px;
    }
    .legend-item {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 13px;
      font-weight: 500;
      color: var(--muted);
    }
    .legend-dot {
      width: 14px; height: 14px; border-radius: 50%;
    }

    /* ── STATS STRIP ── */
    .stats-strip {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 16px;
      margin-bottom: 48px;
    }
    .stat-card {
      background: white;
      border: 1px solid var(--border);
      border-radius: 16px;
      padding: 24px 20px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .stat-card::after {
      content: '';
      position: absolute;
      bottom: 0; left: 0; right: 0;
      height: 3px;
    }
    .stat-card:nth-child(1)::after { background: linear-gradient(90deg, #E91E8C, #FF80BC); }
    .stat-card:nth-child(2)::after { background: linear-gradient(90deg, #4ECDC4, #6BC97E); }
    .stat-card:nth-child(3)::after { background: linear-gradient(90deg, #C77DFF, #E91E8C); }
    .stat-num {
      font-family: 'Playfair Display', serif;
      font-size: 2.2rem;
      font-weight: 700;
      color: var(--pink);
      display: block;
      line-height: 1;
      margin-bottom: 6px;
    }
    .stat-label {
      font-size: 12px;
      font-weight: 500;
      color: var(--muted);
      text-transform: uppercase;
      letter-spacing: 0.08em;
    }

    /* ── DEVELOPER ── */
    .dev-card {
      background: white;
      border: 1px solid var(--border);
      border-radius: 24px;
      padding: 40px 36px;
      display: flex;
      align-items: center;
      gap: 32px;
      position: relative;
      overflow: hidden;
      transition: border-color 0.2s ease, box-shadow 0.2s ease;
    }
    .dev-card::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 60% 80% at 90% 50%, rgba(233,30,140,0.04) 0%, transparent 70%);
      pointer-events: none;
    }
    .dev-card:hover {
      border-color: rgba(233,30,140,0.28);
      box-shadow: 0 8px 40px rgba(233,30,140,0.1);
    }
    .dev-avatar {
      width: 80px; height: 80px;
      border-radius: 50%;
      background: linear-gradient(135deg, #E91E8C, #C77DFF, #FF80BC);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 34px;
      flex-shrink: 0;
      box-shadow: 0 4px 24px rgba(233,30,140,0.3);
    }
    .dev-role {
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      color: var(--pink);
      margin-bottom: 6px;
    }
    .dev-name {
      font-family: 'Playfair Display', serif;
      font-size: 1.7rem;
      color: var(--text);
      margin-bottom: 6px;
    }
    .dev-bio {
      font-size: 13px;
      color: var(--muted);
      line-height: 1.6;
      margin-bottom: 16px;
      font-weight: 300;
    }
    .dev-links {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }
    .dev-link {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-size: 12px;
      font-weight: 500;
      color: var(--muted);
      text-decoration: none;
      background: var(--pink-pale);
      border: 1px solid rgba(233,30,140,0.15);
      border-radius: 10px;
      padding: 7px 14px;
      transition: all 0.15s ease;
    }
    .dev-link:hover {
      color: var(--pink);
      border-color: rgba(233,30,140,0.35);
      background: var(--pink-mid);
    }

    /* ── SUPPORT ── */
    .support-inner {
      background: linear-gradient(135deg, rgba(233,30,140,0.06) 0%, rgba(199,125,255,0.06) 50%, rgba(78,205,196,0.06) 100%);
      border: 1px solid rgba(233,30,140,0.18);
      border-radius: 24px;
      padding: 50px 36px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .support-inner::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 70% 60% at 50% -10%, rgba(233,30,140,0.12) 0%, transparent 60%);
      pointer-events: none;
    }
    .support-inner h2 {
      font-family: 'Playfair Display', serif;
      font-size: 2rem;
      font-weight: 600;
      margin-bottom: 12px;
    }
    .support-inner p {
      font-size: 14px;
      color: var(--muted);
      line-height: 1.75;
      max-width: 440px;
      margin: 0 auto 28px;
      font-weight: 300;
    }

    /* ── FOOTER ── */
    footer {
      position: relative;
      z-index: 1;
      text-align: center;
      padding: 40px 24px;
      font-size: 12px;
      color: #bbb;
      border-top: 1px solid rgba(233,30,140,0.1);
    }
    footer a { color: var(--pink); text-decoration: none; }
    footer a:hover { opacity: 0.75; }

    /* ── NAV ── */
    nav {
      position: sticky;
      top: 0;
      z-index: 100;
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      background: rgba(255,248,251,0.85);
      border-bottom: 1px solid rgba(233,30,140,0.1);
      padding: 14px 32px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .nav-brand {
      display: flex;
      align-items: center;
      gap: 10px;
      font-family: 'Playfair Display', serif;
      font-size: 1.2rem;
      font-weight: 600;
      color: var(--pink);
      text-decoration: none;
    }
    .nav-links {
      display: flex;
      gap: 28px;
      list-style: none;
    }
    .nav-links a {
      font-size: 13px;
      font-weight: 500;
      color: var(--muted);
      text-decoration: none;
      transition: color 0.15s ease;
    }
    .nav-links a:hover { color: var(--pink); }

    @media (max-width: 600px) {
      .nav-links { display: none; }
      .dev-card  { flex-direction: column; text-align: center; }
      .dev-links { justify-content: center; }
      .phone-frame { width: 155px; }
    }

    /* ── FLOATING DOTS ── */
    .dot-decor {
      position: absolute;
      border-radius: 50%;
      pointer-events: none;
      opacity: 0.4;
    }
  </style>
</head>
<body>

  <div class="blob-bg"></div

  <!-- ── HERO ── -->
  <section class="hero">
    <div class="moon-icon">🌙</div>
    <div class="hero-badge">iOS App · SwiftUI</div>
    <h1>Glow Moon</h1>
    <p class="hero-sub">Your cycle, your rhythm</p>
    <p>Track your period, predict your cycle, and understand your body better — all in one beautiful, private app.</p>

    <div class="badge-row">
      <span class="tech-badge"><span class="dot dot-orange"></span>Swift 5</span>
      <span class="tech-badge"><span class="dot dot-blue"></span>SwiftUI</span>
      <span class="tech-badge"><span class="dot dot-pink"></span>iOS 16+</span>
      <span class="tech-badge"><span class="dot dot-green"></span>iCloud Sync</span>
    </div>

    <div class="btn-row">
      <a class="btn btn-primary" href="https://github.com/teesma-dev/GlowMoon">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.44 9.8 8.2 11.38.6.1.82-.26.82-.58v-2.03c-3.34.73-4.04-1.61-4.04-1.61-.55-1.39-1.34-1.76-1.34-1.76-1.09-.75.08-.73.08-.73 1.2.08 1.84 1.24 1.84 1.24 1.07 1.83 2.8 1.3 3.49 1 .11-.78.42-1.3.76-1.6-2.67-.3-5.47-1.33-5.47-5.93 0-1.31.47-2.38 1.24-3.22-.13-.3-.54-1.52.12-3.18 0 0 1.01-.32 3.3 1.23a11.5 11.5 0 0 1 3-.4c1.02 0 2.04.14 3 .4 2.29-1.55 3.3-1.23 3.3-1.23.66 1.66.25 2.88.12 3.18.77.84 1.24 1.91 1.24 3.22 0 4.61-2.81 5.63-5.48 5.92.43.37.81 1.1.81 2.22v3.29c0 .32.22.69.83.57C20.57 21.8 24 17.3 24 12c0-6.63-5.37-12-12-12z"/></svg>
        View on GitHub
      </a>
      <a class="btn btn-github" href="https://github.com/teesma-dev/GlowMoon/archive/refs/heads/main.zip">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
        Download ZIP
      </a>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── SCREENSHOTS ── -->
  <section class="section" id="screenshots">
    <p class="section-label">App Preview</p>
    <h2 class="section-title">Every screen, crafted with care</h2>
    <p class="section-desc">A clean, intuitive flow from setup to deep insights — beautiful at every step.</p>

    <div class="screenshots-scroll">
      <div class="phone-frame">
        <img src="images/screenshot-welcome.png" alt="Welcome Screen" />
        <p class="phone-caption">Welcome</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-onboarding.png" alt="Onboarding" />
        <p class="phone-caption">Setup</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-home.png" alt="Home Dashboard" />
        <p class="phone-caption">Home</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-calendar.png" alt="Calendar View" />
        <p class="phone-caption">Calendar</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-log.png" alt="Log Entry" />
        <p class="phone-caption">Log</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-insights.png" alt="Insights" />
        <p class="phone-caption">Insights</p>
      </div>
      <div class="phone-frame">
        <img src="images/screenshot-settings.png" alt="Settings" />
        <p class="phone-caption">Settings</p>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── CYCLE LEGEND ── -->
  <section class="section" style="padding-top: 48px; padding-bottom: 48px;">
    <div class="legend-strip">
      <div class="legend-item">
        <span class="legend-dot" style="background:#EF5350;"></span> Period
      </div>
      <div class="legend-item">
        <span class="legend-dot" style="background:#4ECDC4;"></span> Fertile Window
      </div>
      <div class="legend-item">
        <span class="legend-dot" style="background:#6BC97E;"></span> Ovulation Day
      </div>
      <div class="legend-item">
        <span class="legend-dot" style="background:#F48FB1;"></span> PMS
      </div>
      <div class="legend-item">
        <span class="legend-dot" style="background:#E91E8C;"></span> Today
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── FEATURES ── -->
  <section class="section" id="features">
    <p class="section-label">What's Inside</p>
    <h2 class="section-title">Everything you need to <em style="font-style:italic;">glow</em></h2>
    <p class="section-desc">Smart tracking meets beautiful design — built for women who want real insights, not noise.</p>

    <div class="features-grid">
      <div class="feature-card fc1">
        <span class="feature-icon">🌙</span>
        <h3>Cycle Tracking</h3>
        <p>Log your period start date and average cycle length. Glow Moon predicts every phase with high accuracy.</p>
      </div>
      <div class="feature-card fc2">
        <span class="feature-icon">🗓️</span>
        <h3>Visual Calendar</h3>
        <p>Color-coded calendar showing period, fertile window, ovulation, and PMS days at a glance.</p>
      </div>
      <div class="feature-card fc3">
        <span class="feature-icon">🌿</span>
        <h3>Fertile Window</h3>
        <p>Know exactly when your fertile window opens and when ovulation day arrives — predicted automatically.</p>
      </div>
      <div class="feature-card fc4">
        <span class="feature-icon">📝</span>
        <h3>Daily Log</h3>
        <p>Log your flow intensity, mood (Happy, Calm, Sad, Anxious, Angry), symptoms, and personal notes each day.</p>
      </div>
      <div class="feature-card fc5">
        <span class="feature-icon">📊</span>
        <h3>Smart Insights</h3>
        <p>Cycle length trends over 6 months, top symptoms breakdown, prediction confidence, and period duration stats.</p>
      </div>
      <div class="feature-card fc6">
        <span class="feature-icon">☁️</span>
        <h3>iCloud Sync</h3>
        <p>Your data syncs privately across all your Apple devices via iCloud — secure and always up to date.</p>
      </div>
      <div class="feature-card fc7">
        <span class="feature-icon">🔔</span>
        <h3>Push Notifications</h3>
        <p>Get timely reminders before your period, during your fertile window, and for daily logging.</p>
      </div>
      <div class="feature-card fc8">
        <span class="feature-icon">⚙️</span>
        <h3>Personalised Settings</h3>
        <p>Appearance, language, first day of week, notification sounds, and full data export — all configurable.</p>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── INSIGHTS / STATS ── -->
  <section class="section" id="insights">
    <p class="section-label">Insights Snapshot</p>
    <h2 class="section-title">Data that <em style="font-style:italic;">means</em> something</h2>
    <p class="section-desc">Glow Moon turns your logs into real patterns — beautiful charts and confident predictions.</p>

    <div class="stats-strip">
      <div class="stat-card">
        <span class="stat-num">28</span>
        <span class="stat-label">Avg cycle length</span>
      </div>
      <div class="stat-card">
        <span class="stat-num">5</span>
        <span class="stat-label">Avg period days</span>
      </div>
      <div class="stat-card">
        <span class="stat-num">92%</span>
        <span class="stat-label">Prediction accuracy</span>
      </div>
    </div>

    <!-- Mini insight preview -->
    <div style="background:white;border:1px solid var(--border);border-radius:20px;padding:28px 28px 20px;display:grid;grid-template-columns:1fr 1fr 1fr;gap:16px;text-align:center;">
      <div>
        <div style="font-size:11px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:var(--muted);margin-bottom:10px;">Top Symptoms</div>
        <div style="display:flex;flex-direction:column;gap:8px;text-align:left;">
          <div>
            <div style="display:flex;justify-content:space-between;font-size:12px;color:var(--muted);margin-bottom:4px;"><span>Cramps</span><span>83%</span></div>
            <div style="height:6px;border-radius:99px;background:#f0e0ea;"><div style="width:83%;height:100%;border-radius:99px;background:linear-gradient(90deg,#E91E8C,#FF80BC);"></div></div>
          </div>
          <div>
            <div style="display:flex;justify-content:space-between;font-size:12px;color:var(--muted);margin-bottom:4px;"><span>Headache</span><span>67%</span></div>
            <div style="height:6px;border-radius:99px;background:#f0e0f5;"><div style="width:67%;height:100%;border-radius:99px;background:linear-gradient(90deg,#C77DFF,#E91E8C);"></div></div>
          </div>
          <div>
            <div style="display:flex;justify-content:space-between;font-size:12px;color:var(--muted);margin-bottom:4px;"><span>Bloating</span><span>50%</span></div>
            <div style="height:6px;border-radius:99px;background:#f5e0ea;"><div style="width:50%;height:100%;border-radius:99px;background:linear-gradient(90deg,#FF80BC,#FF4081);"></div></div>
          </div>
        </div>
      </div>
      <div>
        <div style="font-size:11px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:var(--muted);margin-bottom:10px;">Moods Logged</div>
        <div style="display:flex;flex-wrap:wrap;gap:8px;justify-content:center;margin-top:8px;">
          <span style="background:#E8F5E9;color:#388E3C;padding:5px 12px;border-radius:99px;font-size:12px;font-weight:500;">😊 Happy</span>
          <span style="background:#E3F2FD;color:#1565C0;padding:5px 12px;border-radius:99px;font-size:12px;font-weight:500;">😌 Calm</span>
          <span style="background:#FCE4EC;color:#C2185B;padding:5px 12px;border-radius:99px;font-size:12px;font-weight:500;">😔 Sad</span>
          <span style="background:#FFF8E1;color:#F57F17;padding:5px 12px;border-radius:99px;font-size:12px;font-weight:500;">😟 Anxious</span>
        </div>
      </div>
      <div>
        <div style="font-size:11px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:var(--muted);margin-bottom:10px;">Next Period</div>
        <div style="background:linear-gradient(135deg,rgba(233,30,140,0.07),rgba(199,125,255,0.07));border:1px solid rgba(233,30,140,0.15);border-radius:14px;padding:14px 12px;margin-top:4px;">
          <div style="font-size:11px;color:var(--muted);margin-bottom:4px;">Predicted</div>
          <div style="font-family:'Playfair Display',serif;font-size:1.1rem;font-weight:600;color:var(--pink);">Apr 23 – 27</div>
          <div style="font-size:11px;color:var(--muted);margin-top:4px;">High confidence · 6 cycles</div>
        </div>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── REQUIREMENTS ── -->
  <section class="section" style="padding-bottom: 48px;">
    <p class="section-label">Requirements</p>
    <h2 class="section-title" style="margin-bottom:36px;">Get started in minutes</h2>
    <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:14px;">
      <div style="background:white;border:1px solid var(--border);border-radius:16px;padding:22px 20px;display:flex;align-items:center;gap:14px;">
        <span style="font-size:28px;">📱</span>
        <div>
          <div style="font-size:13px;font-weight:600;margin-bottom:3px;">iOS 16.0+</div>
          <div style="font-size:12px;color:var(--muted);">iPhone supported</div>
        </div>
      </div>
      <div style="background:white;border:1px solid var(--border);border-radius:16px;padding:22px 20px;display:flex;align-items:center;gap:14px;">
        <span style="font-size:28px;">🛠️</span>
        <div>
          <div style="font-size:13px;font-weight:600;margin-bottom:3px;">Xcode 15+</div>
          <div style="font-size:12px;color:var(--muted);">For building from source</div>
        </div>
      </div>
      <div style="background:white;border:1px solid var(--border);border-radius:16px;padding:22px 20px;display:flex;align-items:center;gap:14px;">
        <span style="font-size:28px;">🦅</span>
        <div>
          <div style="font-size:13px;font-weight:600;margin-bottom:3px;">Swift 5</div>
          <div style="font-size:12px;color:var(--muted);">SwiftUI framework</div>
        </div>
      </div>
      <div style="background:white;border:1px solid var(--border);border-radius:16px;padding:22px 20px;display:flex;align-items:center;gap:14px;">
        <span style="font-size:28px;">☁️</span>
        <div>
          <div style="font-size:13px;font-weight:600;margin-bottom:3px;">iCloud Account</div>
          <div style="font-size:12px;color:var(--muted);">For sync (optional)</div>
        </div>
      </div>
    </div>

    <!-- Install command -->
    <div style="margin-top:28px;background:#1A0A12;border-radius:16px;padding:20px 24px;display:flex;align-items:center;justify-content:space-between;gap:16px;">
      <code style="font-size:13px;color:#FF80BC;font-family:'SF Mono','Fira Code',monospace;">git clone https://github.com/teesma-dev/GlowMoon.git</code>
      <span style="font-size:11px;color:#555;white-space:nowrap;">Then open in Xcode → ⌘R</span>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── DEVELOPER ── -->
  <section class="section" id="developer">
    <p class="section-label">Developer</p>
    <h2 class="section-title" style="margin-bottom:32px;">Meet the maker</h2>
    <div class="dev-card">
      <div class="dev-avatar">👩‍💻</div>
      <div style="flex:1;min-width:0;">
        <div class="dev-role">Built with 🩷 by</div>
        <div class="dev-name">Teeshma M</div>
        <div class="dev-bio">iOS developer from Chennai, India — passionate about crafting beautiful, purposeful apps that genuinely improve everyday life.</div>
        <div class="dev-links">
          <a class="dev-link" href="https://github.com/teesma-dev" target="_blank" rel="noopener">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.44 9.8 8.2 11.38.6.1.82-.26.82-.58v-2.03c-3.34.73-4.04-1.61-4.04-1.61-.55-1.39-1.34-1.76-1.34-1.76-1.09-.75.08-.73.08-.73 1.2.08 1.84 1.24 1.84 1.24 1.07 1.83 2.8 1.3 3.49 1 .11-.78.42-1.3.76-1.6-2.67-.3-5.47-1.33-5.47-5.93 0-1.31.47-2.38 1.24-3.22-.13-.3-.54-1.52.12-3.18 0 0 1.01-.32 3.3 1.23a11.5 11.5 0 0 1 3-.4c1.02 0 2.04.14 3 .4 2.29-1.55 3.3-1.23 3.3-1.23.66 1.66.25 2.88.12 3.18.77.84 1.24 1.91 1.24 3.22 0 4.61-2.81 5.63-5.48 5.92.43.37.81 1.1.81 2.22v3.29c0 .32.22.69.83.57C20.57 21.8 24 17.3 24 12c0-6.63-5.37-12-12-12z"/></svg>
            GitHub
          </a>
          <a class="dev-link" href="mailto:teeshmateeshu@gmail.com" rel="noopener">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
            Contact
          </a>
          <a class="dev-link" href="https://buymeacoffee.com/teeshmateex" target="_blank" rel="noopener">☕ Buy Me a Coffee</a>
        </div>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── SUPPORT ── -->
  <section class="section" style="padding-top:60px; padding-bottom:60px;">
    <div class="support-inner">
      <h2>Love Glow Moon? 🌙</h2>
      <p>Glow Moon is free and open-source. If it helps you understand your body better and plan your month with confidence, consider buying me a coffee!</p>
      <a class="btn btn-coffee" href="https://buymeacoffee.com/teeshmateex" target="_blank" rel="noopener" style="display:inline-flex;margin:0 auto;">
        ☕ Buy Me a Coffee
      </a>
    </div>
  </section>

  <footer>
    Built with 🩷 in Chennai, India by <a href="https://github.com/teesma-dev">Teeshma M</a>
    &nbsp;·&nbsp; Glow Moon &nbsp;·&nbsp;
    <a href="https://github.com/teesma-dev/GlowMoon">GitHub</a>
  </footer>

</body>
</html>
