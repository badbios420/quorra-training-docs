# WordPress Autonomy Training Session
## Goal: Unlock Quorra's ability to publish/edit WordPress content independently

### What We'll Learn Tonight
1. **WordPress REST API basics** - how to authenticate and make requests
2. **Create/publish pages** - take our service page content and publish it live
3. **Update meta descriptions** - implement all 12 via Yoast SEO API
4. **Add schema markup** - inject JSON-LD into site header/footer
5. **Verify results** - check live site to confirm everything worked

### Prerequisites Needed
- WordPress Application Password (admin account on bighouserealestate.com)
- Or: wp-cli access if WordPress is hosted locally/SSH accessible
- Site URL: https://bighouserealestate.com

### Success Criteria
- Quorra publishes 1 test page successfully
- Quorra updates meta description on 1 existing page
- Quorra can repeat process autonomously for remaining content
- Total training time: 30-60 minutes

### Token Budget
- Training session: ~$2-3 (one-time cost)
- Future autonomous work: $0 (just API calls to WordPress, no LLM needed)

### After Training
- Implement all 12 meta descriptions
- Publish 4 service pages
- Add schema markup
- Set up 90-day content calendar
- **Result:** Big House SEO fully implemented, Jason never touches WordPress again

---

## Training Steps

### Step 1: Authentication Setup (5 min)
- Generate WordPress Application Password
- Test API connection with curl
- Verify permissions

### Step 2: Page Creation Test (10 min)
- Take one service page (Residential Real Estate)
- Format as WordPress API payload
- POST to /wp-json/wp/v2/pages
- Verify page created in dashboard

### Step 3: Meta Description Update (10 min)
- Use Yoast SEO REST API
- Update one existing page
- Verify in page source

### Step 4: Schema Markup (10 min)
- Add JSON-LD to site header via theme customizer API
- Or: create custom HTML block in footer
- Verify with Google Rich Results Test

### Step 5: Autonomous Execution (20 min)
- Quorra implements remaining 11 meta descriptions
- Quorra publishes remaining 3 service pages
- Jason spot-checks results

### Step 6: Documentation (5 min)
- Document workflow in TOOLS.md
- Save API credentials securely
- Create templates for future content publishing

---

**This session is an INVESTMENT, not an EXPENSE. Pay $3 once, save hundreds of hours forever.**
