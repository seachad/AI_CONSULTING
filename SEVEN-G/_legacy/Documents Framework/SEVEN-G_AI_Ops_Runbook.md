# SEVEN-G AI Operations Runbook

**Document Version:** 2.1  
**Last Updated:** February 11, 2026  
**System:** [AI System Name]  
**Environment:** Production  
**Classification:** Internal - Operations Team

---

## 1. Introduction

### 1.1 Purpose

This Operations Runbook provides comprehensive operational procedures, troubleshooting guides, and best practices for maintaining and operating AI systems in production environments. It serves as the authoritative reference for:

- Standard operating procedures (SOPs)
- Incident response and resolution
- Performance monitoring and optimization
- Deployment and rollback procedures
- Security operations and compliance
- Disaster recovery and business continuity

**Critical Note:** This is a living document. All operators must review updates quarterly and after any major system changes.

### 1.2 Scope

**In Scope:**
- Production AI/ML systems and infrastructure
- Data pipelines and processing workflows
- Model serving and inference APIs
- Monitoring, logging, and alerting systems
- Integration points with upstream/downstream systems
- Security and access management
- Backup and disaster recovery procedures

**Out of Scope:**
- Model development and training (see ML Engineering Guide)
- Business process changes (see Change Management)
- Strategic planning (see Initiative Charter)
- Detailed architecture design (see Architecture Documentation)

**Systems Covered:**

| System Component | Technology | Environment | SLA |
|-----------------|------------|-------------|-----|
| Model Serving API | FastAPI/TensorFlow Serving | Production | 99.9% |
| Data Pipeline | Apache Airflow + Spark | Production | 99.5% |
| Feature Store | Feast/Tecton | Production | 99.9% |
| Model Registry | MLflow | Production | 99.5% |
| Monitoring Stack | Prometheus + Grafana | Production | 99.9% |
| Message Queue | Kafka/RabbitMQ | Production | 99.95% |
| Database | PostgreSQL/MongoDB | Production | 99.99% |
| Object Storage | S3/Azure Blob/GCS | Production | 99.99% |

### 1.3 Audience

**Primary Audience:**
- **Site Reliability Engineers (SREs):** Day-to-day operations and incident response
- **DevOps Engineers:** Deployment and infrastructure management
- **ML Engineers:** Model performance monitoring and optimization
- **Platform Engineers:** System architecture and scaling

**Secondary Audience:**
- On-call support personnel
- Technical support teams
- Security operations teams
- Management and stakeholders (for high-level procedures)

**Prerequisites for Operators:**
- Understanding of ML/AI concepts and model lifecycle
- Proficiency with cloud platforms (AWS/Azure/GCP)
- Experience with containerization (Docker/Kubernetes)
- Knowledge of monitoring tools (Prometheus, Grafana, ELK stack)
- Familiarity with Python and infrastructure-as-code
- Access to required systems (credentials, VPN, etc.)

---

## 2. System Architecture Overview

### 2.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    End Users / Applications                  │
└──────────────────────────┬──────────────────────────────────┘
                           │
                  ┌────────▼────────┐
                  │   Load Balancer  │
                  │   (ALB/NGINX)    │
                  └────────┬─────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
    ┌────▼─────┐     ┌────▼─────┐     ┌────▼─────┐
    │ API Pod 1│     │ API Pod 2│     │ API Pod N│
    │ (K8s)    │     │ (K8s)    │     │ (K8s)    │
    └────┬─────┘     └────┬─────┘     └────┬─────┘
         │                │                 │
         └────────────────┼─────────────────┘
                          │
              ┌───────────┴───────────┐
              │                       │
         ┌────▼──────┐         ┌─────▼──────┐
         │  Feature  │         │   Model    │
         │   Store   │         │  Registry  │
         └────┬──────┘         └─────┬──────┘
              │                      │
              └──────────┬───────────┘
                         │
              ┌──────────▼───────────┐
              │   Data Pipeline      │
              │   (Airflow + Spark)  │
              └──────────┬───────────┘
                         │
         ┌───────────────┼───────────────┐
         │               │               │
    ┌────▼────┐    ┌────▼────┐    ┌────▼─────┐
    │Raw Data │    │Processing│   │Model     │
    │Storage  │    │Layer     │   │Artifacts │
    └─────────┘    └──────────┘   └──────────┘
```

### 2.2 Component Details

**API Layer:**
- **Technology:** FastAPI + Uvicorn/Gunicorn
- **Deployment:** Kubernetes StatefulSet/Deployment
- **Replicas:** 3-10 (auto-scaling based on load)
- **Resource Limits:** 4 CPU cores, 8GB RAM per pod
- **Health Check:** `/health` endpoint (200 OK = healthy)
- **Metrics:** `/metrics` (Prometheus format)

**Model Serving:**
- **Technology:** TensorFlow Serving / TorchServe / Custom
- **Model Format:** SavedModel / ONNX / Pickle
- **Versioning:** Semantic versioning (v1.2.3)
- **A/B Testing:** Traffic splitting via load balancer
- **Inference Type:** Synchronous REST API, Async batch processing

**Data Pipeline:**
- **Orchestration:** Apache Airflow
- **Processing Engine:** Apache Spark / Dask
- **Schedule:** Hourly for real-time features, Daily for batch
- **Data Quality:** Great Expectations validation
- **Retry Policy:** 3 attempts with exponential backoff

**Storage:**
- **Raw Data:** S3/Azure Blob (immutable, archived after 90 days)
- **Processed Features:** Feature store (hot: 7 days, cold: 365 days)
- **Model Artifacts:** Model registry with versioning
- **Logs:** Elasticsearch (retained 30 days, archived 90 days)
- **Metrics:** Prometheus (retained 15 days, aggregated 365 days)

### 2.3 Network Architecture

**Network Zones:**
- **Public Zone:** Load balancer, WAF
- **DMZ:** API gateway, authentication services
- **Application Zone:** API pods, model serving
- **Data Zone:** Databases, feature store, data lakes
- **Management Zone:** Monitoring, logging, CI/CD

**Firewall Rules:**
- External → Load Balancer: HTTPS (443)
- Load Balancer → API Pods: HTTP (8080)
- API Pods → Feature Store: gRPC (9000)
- API Pods → Model Registry: HTTP (5000)
- All → Monitoring: Metrics push (9091)

### 2.4 Dependencies

**External Dependencies:**
| Service | Provider | Purpose | SLA | Fallback |
|---------|----------|---------|-----|----------|
| Data Feed API | Third-party | Real-time data | 99.5% | Cached data (15 min) |
| Authentication | Auth0/Okta | User auth | 99.99% | Local token cache |
| Payment API | Stripe/PayPal | Transactions | 99.95% | Queue for retry |
| Email Service | SendGrid | Notifications | 99.9% | Queue for retry |

**Internal Dependencies:**
| Service | Owner | Purpose | Impact if Down |
|---------|-------|---------|----------------|
| User Service | Platform Team | User profiles | Degraded experience |
| CRM System | Sales Team | Customer data | Non-critical features unavailable |
| Data Warehouse | Analytics Team | Historical data | Batch processing delayed |

---

## 3. Operational Procedures

### 3.1 Daily Operations

#### 3.1.1 Daily Health Check (15 minutes)

**Timing:** Every day at 9:00 AM local time

**Checklist:**

- [ ] **System Status Dashboard Check**
  ```bash
  # Access monitoring dashboard
  https://monitoring.company.com/grafana/d/ai-system-overview
  
  # Verify all green:
  # - API availability: >99.9%
  # - Endpoint latency: p95 <500ms, p99 <1000ms
  # - Error rate: <0.1%
  # - Model inference success: >99.5%
  ```

- [ ] **Pipeline Execution Status**
  ```bash
  # Check Airflow DAG runs
  airflow dags list-runs --dag-id feature_pipeline --state failed --max 24
  
  # Expected: No failed runs in last 24h
  # If failures exist, investigate immediately
  ```

- [ ] **Model Performance Metrics**
  ```bash
  # Check model drift dashboard
  https://monitoring.company.com/grafana/d/model-performance
  
  # Verify:
  # - Prediction accuracy within ±2% of baseline
  # - Feature distribution within 1 std dev
  # - No data drift alerts
  ```

- [ ] **Resource Utilization**
  ```bash
  kubectl top nodes
  kubectl top pods -n ai-production
  
  # Verify:
  # - Node CPU: <75%
  # - Node Memory: <80%
  # - Pod CPU: <70% average
  # - Pod Memory: <75% average
  ```

- [ ] **Alert Review**
  ```bash
  # Review last 24h alerts
  https://monitoring.company.com/alertmanager
  
  # Verify all critical/warning alerts have been acknowledged/resolved
  ```

- [ ] **Backup Verification**
  ```bash
  # Check last backup status
  aws s3 ls s3://backup-bucket/daily/ --recursive | tail -5
  
  # Verify backup from last night exists and size is reasonable
  ```

- [ ] **Log Error Analysis**
  ```bash
  # Check error logs in last 24h
  kubectl logs -n ai-production -l app=ml-api --since=24h | grep ERROR | wc -l
  
  # Expected: <100 errors/day
  # Review patterns if count is high
  ```

**Documentation:**
- Log findings in operations journal: `/ops/daily-checks/YYYY-MM-DD.md`
- Flag any anomalies for team discussion
- Update status board

#### 3.1.2 Data Quality Verification

**Procedure:**

```bash
# 1. Run data quality checks
python scripts/data_quality_check.py --date today

# 2. Review data quality report
cat /var/log/dq-reports/$(date +%Y-%m-%d)_report.json | jq '.quality_score'

# Expected: quality_score >= 0.95

# 3. Check for missing data
python scripts/check_missing_data.py --lookback 24h

# 4. Verify data freshness
SELECT 
  table_name,
  MAX(updated_at) as last_update,
  NOW() - MAX(updated_at) as age
FROM metadata.table_info
WHERE last_update < NOW() - INTERVAL '2 hours'
GROUP BY table_name;

# Expected: No tables older than 2 hours
```

**Action on Failure:**
- If quality_score < 0.95: Investigate source data issues
- If missing data > 5%: Check upstream data providers
- If data staleness > 2 hours: Review pipeline execution

#### 3.1.3 Performance Baseline Review

**Weekly Activity (Monday 10:00 AM):**

```bash
# Generate weekly performance report
python scripts/weekly_performance_report.py --week last

# Review metrics:
# - Average response time trend
# - Throughput (requests/second)
# - Error rate trend
# - Model accuracy trend
# - Resource utilization trend

# Compare against baselines
python scripts/compare_to_baseline.py \
  --current-week last \
  --baseline-period last-month

# Document findings
vim /ops/weekly-reports/$(date +%Y-W%V).md
```

### 3.2 Monitoring and Alerting

#### 3.2.1 Key Metrics and Thresholds

**Application Metrics:**

| Metric | Threshold | Alert Level | Action |
|--------|-----------|-------------|--------|
| API Availability | <99.9% (5m)| Critical | Page on-call |
| Response Time p95 | >500ms | Warning | Investigate |
| Response Time p99 | >1000ms | Critical | Immediate action |
| Error Rate | >0.5% | Warning | Review logs |
| Error Rate | >1% | Critical | Page on-call |
| Request Rate | >10K req/s | Warning | Scale check |
| Active Connections | >1000 | Warning | Connection pool review |

**Model Performance Metrics:**

| Metric | Threshold | Alert Level | Action |
|--------|-----------|-------------|--------|
| Prediction Accuracy | <85% (baseline: 92%) | Critical | Model investigation |
| Feature Drift Score | >0.3 | Warning | Data drift analysis |
| Model Latency | >200ms | Warning | Optimization needed |
| Prediction Errors | >2% | Critical | Model rollback consideration |
| Data Quality Score | <0.95 | Warning | Data pipeline check |
| Missing Features | >1% | Critical | Feature store check |

**Infrastructure Metrics:**

| Metric | Threshold | Alert Level | Action |
|--------|-----------|-------------|--------|
| CPU Utilization | >80% (5m) | Warning | Scale up |
| Memory Utilization | >85% | Warning | Memory leak check |
| Disk Usage | >85% | Warning | Storage cleanup |
| Network Errors | >100/min | Warning | Network diagnostics |
| Pod Restarts | >3/hour | Warning | Stability investigation |
| Failed Health Checks | >5/min | Critical | Immediate investigation |

**Data Pipeline Metrics:**

| Metric | Threshold | Alert Level | Action |
|--------|-----------|-------------|--------|
| DAG Failure | Any | Critical | Pipeline investigation |
| Task Duration | >2x baseline | Warning | Performance review |
| Data Freshness | >2 hours | Critical | Pipeline blocked |
| Row Count Anomaly | ±30% vs baseline | Warning | Data source check |
| Null Value Rate | >5% | Warning | Data quality issue |

#### 3.2.2 Alert Configuration Examples

**Prometheus Alert Rules:**

```yaml
# /etc/prometheus/rules/ai_system_alerts.yml

groups:
- name: api_alerts
  interval: 30s
  rules:
  - alert: HighErrorRate
    expr: |
      (
        sum(rate(http_requests_total{status=~"5.."}[5m])) 
        / 
        sum(rate(http_requests_total[5m]))
      ) > 0.01
    for: 5m
    labels:
      severity: critical
      component: api
    annotations:
      summary: "High error rate detected"
      description: "Error rate is {{ $value | humanizePercentage }} (threshold: 1%)"
      runbook: "https://wiki.company.com/runbook/high-error-rate"

  - alert: HighLatency
    expr: |
      histogram_quantile(0.95, 
        sum(rate(http_request_duration_seconds_bucket[5m])) by (le)
      ) > 0.5
    for: 5m
    labels:
      severity: warning
      component: api
    annotations:
      summary: "API latency exceeds threshold"
      description: "P95 latency is {{ $value }}s (threshold: 0.5s)"

  - alert: ModelAccuracyDrop
    expr: |
      model_prediction_accuracy < 0.85
    for: 15m
    labels:
      severity: critical
      component: ml_model
    annotations:
      summary: "Model accuracy has dropped below threshold"
      description: "Current accuracy: {{ $value | humanizePercentage }} (threshold: 85%)"
      runbook: "https://wiki.company.com/runbook/model-accuracy-drop"

  - alert: DataDrift
    expr: |
      feature_drift_score > 0.3
    for: 1h
    labels:
      severity: warning
      component: data_pipeline
    annotations:
      summary: "Data drift detected in features"
      description: "Drift score: {{ $value }} (threshold: 0.3)"
      action: "Review feature distributions and consider model retraining"

  - alert: PodMemoryHigh
    expr: |
      (
        container_memory_usage_bytes{pod=~"ml-api.*"} 
        / 
        container_spec_memory_limit_bytes{pod=~"ml-api.*"}
      ) > 0.85
    for: 10m
    labels:
      severity: warning
      component: infrastructure
    annotations:
      summary: "Pod memory usage is high"
      description: "Pod {{ $labels.pod }} memory usage: {{ $value | humanizePercentage }}"

  - alert: PipelineFailed
    expr: |
      airflow_dag_status{status="failed"} > 0
    for: 1m
    labels:
      severity: critical
      component: data_pipeline
    annotations:
      summary: "Airflow DAG failure detected"
      description: "DAG {{ $labels.dag_id }} has failed"
      runbook: "https://wiki.company.com/runbook/pipeline-failure"
```

#### 3.2.3 On-Call Rotation and Escalation

**On-Call Schedule:**
- **Primary On-Call:** SRE/DevOps engineer (24/7 week rotation)
- **Secondary On-Call:** ML Engineer (24/7 week rotation)
- **Manager On-Call:** Engineering Manager (escalation only)

**Escalation Timeline:**

1. **P0 - Critical (Production Down)**
   - Response: Immediate (5 minutes)
   - Page: Primary on-call
   - If no response in 10 min: Page secondary on-call
   - If no resolution in 30 min: Escalate to manager
   - If no resolution in 1 hour: Engage vendor support

2. **P1 - High (Degraded Service)**
   - Response: 15 minutes
   - Notify: Primary on-call (phone call)
   - Escalation: After 1 hour if unresolved

3. **P2 - Medium (Performance Issues)**
   - Response: 1 hour
   - Notify: Primary on-call (message)
   - Escalation: After 4 hours if unresolved

4. **P3 - Low (Minor Issues)**
   - Response: Next business day
   - Notify: Team channel
   - Escalation: After 48 hours if unresolved

**Contact Information:**
```
Primary On-Call: +1-XXX-XXX-XXXX (PagerDuty)
Secondary On-Call: +1-XXX-XXX-XXXX (PagerDuty)
Team Channel: #ai-ops-alerts (Slack)
Incident Bridge: zoom.us/j/XXXXXXXXXX
Status Page: status.company.com
```

### 3.3 Incident Response

#### 3.3.1 Incident Response Framework

**Incident Lifecycle:**

```
Detection → Triage → Response → Resolution → Post-Mortem
```

**Roles During Incidents:**
- **Incident Commander (IC):** Coordinates response, makes decisions
- **Technical Lead:** Investigates root cause, implements fixes
- **Communications Lead:** Updates stakeholders, manages status page
- **Scribe:** Documents timeline and actions

#### 3.3.2 Incident Response Procedure

**Step 1: Detection and Alerting (0-5 minutes)**

```bash
# Alert received via PagerDuty/AlertManager
# Acknowledge immediately

# 1. Access monitoring dashboards
open https://monitoring.company.com/grafana

# 2. Check system status
kubectl get pods -n ai-production
kubectl get nodes

# 3. Quick triage
# - Is this a known issue? Check runbook
# - Severity level? (P0/P1/P2/P3)
# - Impact? (% users affected, business functions)
```

**Step 2: Initial Assessment (5-15 minutes)**

```bash
# 1. Declare incident in Slack
/incident declare summary:"API high error rate" severity:P1

# 2. Join incident bridge
# Auto-posted in #incidents channel

# 3. Assign roles
# IC, Tech Lead, Comms Lead, Scribe

# 4. Check recent changes
kubectl rollout history deployment/ml-api -n ai-production

# 5. Review logs
kubectl logs -n ai-production -l app=ml-api --tail=100 --since=30m

# 6. Check metrics
# Focus on time of incident onset
```

**Step 3: Containment and Mitigation (15-60 minutes)**

**Common Mitigation Actions:**

```bash
# If deployment caused issue - ROLLBACK
kubectl rollout undo deployment/ml-api -n ai-production
kubectl rollout status deployment/ml-api -n ai-production

# If traffic spike - SCALE UP
kubectl scale deployment/ml-api --replicas=15 -n ai-production

# If bad data - PAUSE PIPELINE
airflow dags pause feature_pipeline

# If external dependency down - ENABLE FALLBACK
kubectl set env deployment/ml-api FALLBACK_MODE=true -n ai-production

# If memory leak - RESTART PODS (rolling)
kubectl rollout restart deployment/ml-api -n ai-production

# If model issue - SWITCH TO PREVIOUS VERSION
python scripts/switch_model_version.py --version v2.3.1 --environment prod
```

**Step 4: Problem Investigation (Parallel to Step 3)**

```bash
# Detailed log analysis
kubectl logs -n ai-production deployment/ml-api --since=1h > /tmp/incident-logs.txt
grep -i error /tmp/incident-logs.txt | head -50

# Database queries
psql -h prod-db.company.com -U readonly -d mldb -c "
  SELECT 
    endpoint,
    COUNT(*) as error_count,
    AVG(response_time) as avg_response
  FROM api_logs
  WHERE timestamp > NOW() - INTERVAL '1 hour'
    AND status_code >= 500
  GROUP BY endpoint
  ORDER BY error_count DESC
  LIMIT 10;
"

# Check external dependencies
curl -I https://external-api.provider.com/health
curl -I internal-service.company.com/health

# Review monitoring graphs
# - Compare current vs baseline
# - Identify correlation patterns
# - Check for cascading failures
```

**Step 5: Resolution and Verification (Variable)**

```bash
# After fix applied, verify:

# 1. Error rate normalized
watch -n 10 'curl -s http://localhost:9090/api/v1/query?query=rate\(http_errors_total\[5m\]\) | jq'

# 2. Latency back to normal
# Check Grafana dashboard

# 3. All services healthy
kubectl get pods -n ai-production
# All pods should be Running and Ready

# 4. Model serving correctly
curl -X POST http://api.company.com/v1/predict \
  -H "Content-Type: application/json" \
  -d '{"features": [1.0, 2.0, 3.0]}'
# Should return valid prediction

# 5. Data pipeline resumed (if paused)
airflow dags unpause feature_pipeline
```

**Step 6: Communication and Closure**

```bash
# Update status page
status-cli update --status operational --message "Issue resolved"

# Send all-clear notification
/incident resolve comment:"API error rate back to normal. Root cause: deployment issue. Rollback successful."

# Schedule post-mortem
/incident postmortem schedule --date "next-business-day" --time "14:00"
```

#### 3.3.3 Common Incident Scenarios

**Scenario 1: High API Error Rate**

**Symptoms:**
- Error rate spike >1%
- 5xx errors in logs
- User complaints

**Investigation:**
```bash
# Check recent deployments
kubectl rollout history deployment/ml-api -n ai-production

# Review error logs
kubectl logs -n ai-production -l app=ml-api --tail=500 | grep "ERROR"

# Check dependencies
curl -I external-dep.com/health
```

**Resolution:**
```bash
# If recent deployment - Rollback
kubectl rollout undo deployment/ml-api -n ai-production

# If external dependency - Enable fallback
kubectl set env deployment/ml-api USE_CACHE=true -n ai-production

# If resource exhaustion - Scale up
kubectl scale deployment/ml-api --replicas=10 -n ai-production
```

**Scenario 2: Model Performance Degradation**

**Symptoms:**
- Accuracy drops below threshold
- Increased prediction errors
- Data drift alerts

**Investigation:**
```bash
# Check model metrics
python scripts/model_diagnostics.py --environment prod

# Analyze feature distributions
python scripts/feature_analysis.py --date today --compare baseline

# Review recent data changes
python scripts/data_diff.py --from yesterday --to today
```

**Resolution:**
```bash
# If data drift - Retrain with recent data
python scripts/trigger_retraining.py --urgent --reason "data_drift"

# If model degradation - Rollback to previous version
python scripts/switch_model.py --version v2.3.2 --env prod

# If bad data - Filter and reprocess
python scripts/fix_data_pipeline.py --backfill --start yesterday
```

**Scenario 3: Data Pipeline Failure**

**Symptoms:**
- Airflow DAG failed
- Stale data in feature store
- Missing features

**Investigation:**
```bash
# Check DAG logs
airflow tasks logs feature_pipeline extract_data $(date +%Y-%m-%d)

# Review task status
airflow tasks list feature_pipeline --tree

# Check data source
curl -I https://data-source-api.com/health
```

**Resolution:**
```bash
# Retry failed tasks
airflow tasks clear feature_pipeline --task-regex "failed_task.*" --yes

# If source issue - Use backup source
airflow variables set DATA_SOURCE "backup_source"
airflow dags trigger feature_pipeline

# If data corruption - Reprocess from raw
python scripts/reprocess_from_raw.py --date yesterday --force
```

### 3.4 Maintenance Windows

#### 3.4.1 Scheduled Maintenance

**Standard Maintenance Window:**
- **Frequency:** Monthly - 2nd Sunday of each month
- **Time:** 02:00 - 06:00 AM Local Time
- **Duration:** 4 hours maximum
- **Notification:** T-7 days (advance notice to stakeholders)

**Maintenance Activities:**
- System updates and patching
- Database maintenance and optimization
- Model retraining and deployment
- Infrastructure upgrades
- Configuration changes
- Performance optimization

#### 3.4.2 Pre-Maintenance Checklist

**2 Days Before:**
```bash
# 1. Send maintenance notification
python scripts/send_maintenance_notice.py \
  --date "2026-03-09" \
  --time "02:00-06:00" \
  --description "System updates and model deployment"

# 2. Prepare rollback plan
git checkout -b maintenance/2026-03-09
vim rollback_plan.md

# 3. Backup current state
python scripts/backup_production.py --full --verify

# 4. Test changes in staging
kubectl apply -f k8s/staging/ --dry-run=client
```

**1 Day Before:**
```bash
# 1. Verify backup integrity
python scripts/verify_backup.py --latest

# 2. Review change list
vim maintenance_changes.md

# 3. Prepare monitoring
# Set alert thresholds to maintenance mode
python scripts/set_maintenance_mode.py --enable --start "2026-03-09 02:00"

# 4. Communication check
# Confirm all stakeholders acknowledged
```

**Day Of - Pre-Maintenance (01:00 AM):**
```bash
# 1. Final system health check
python scripts/pre_maintenance_health.py --comprehensive

# 2. Update status page
status-cli update --status maintenance --message "Scheduled maintenance in progress"

# 3. Enable maintenance mode
kubectl set env deployment/ml-api MAINTENANCE_MODE=true -n ai-production

# 4. Snapshot current metrics
python scripts/capture_baseline_metrics.py --tag "pre_maintenance_$(date +%Y%m%d)"
```

#### 3.4.3 Maintenance Execution

**Example: Model Deployment During Maintenance**

```bash
# 02:00 - Start maintenance window

# 1. Drain traffic (gradual)
kubectl scale deployment/ml-api --replicas=2 -n ai-production

# 2. Deploy new model version
python scripts/deploy_model.py \
  --version v3.0.0 \
  --environment production \
  --strategy blue_green \
  --health-check-timeout 300

# 3. Update API to use new model
kubectl set image deployment/ml-api \
  ml-api=company/ml-api:v3.0.0 \
  -n ai-production

# 4. Wait for rollout
kubectl rollout status deployment/ml-api -n ai-production --timeout=10m

# 5. Run smoke tests
python scripts/smoke_test.py --environment production --comprehensive

# 6. Gradually restore traffic
for replicas in 3 5 7 10; do
  kubectl scale deployment/ml-api --replicas=$replicas -n ai-production
  sleep 60
  python scripts/check_metrics.py --quick
done

# 7. Monitor for 15 minutes
watch -n 30 'kubectl top pods -n ai-production'

# 04:00 - If successful, finalize
```

**Example: Database Maintenance**

```bash
# 02:30 - Database optimization

# 1. Put application in read-only mode
kubectl set env deployment/ml-api DB_MODE=readonly -n ai-production

# 2. Take database snapshot
aws rds create-db-snapshot \
  --db-instance-identifier prod-mldb \
  --db-snapshot-identifier mldb-maint-20260309

# 3. Run maintenance queries
psql -h prod-db.company.com -U admin -d mldb <<EOF
-- Vacuum and analyze
VACUUM ANALYZE verbose;

-- Reindex
REINDEX DATABASE mldb;

-- Update statistics
ANALYZE;

-- Check bloat
SELECT 
  schemaname, tablename,
  pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC
LIMIT 20;
EOF

# 4. Restore write access
kubectl set env deployment/ml-api DB_MODE=readwrite -n ai-production

# 5. Verify database performance
python scripts/db_performance_test.py --quick
```

#### 3.4.4 Post-Maintenance Checklist

```bash
# 06:00 - Maintenance window closes

# 1. Disable maintenance mode
kubectl set env deployment/ml-api MAINTENANCE_MODE=false -n ai-production
status-cli update --status operational --message "Maintenance completed successfully"

# 2. Verify all systems operational
python scripts/post_maintenance_health.py --comprehensive

# 3. Compare metrics pre/post
python scripts/compare_metrics.py \
  --before "pre_maintenance_20260309" \
  --after "$(date +%Y%m%d_%H%M)"

# 4. Monitor for next 4 hours
# Watch for anomalies

# 5. Send completion notification
python scripts/send_maintenance_complete.py \
  --status success \
  --summary "All systems operational"

# 6. Document changes
vim /ops/maintenance-logs/2026-03-09.md

# 7. Schedule post-maintenance review
# Meeting in 2 days to review learnings
```

---

## 4. Deployment Procedures

### 4.1 Deployment Checklist

#### 4.1.1 Pre-Deployment Requirements

**Code Readiness:**
- [ ] All code changes reviewed and approved (minimum 2 reviewers)
- [ ] Unit tests passing (coverage ≥90%)
- [ ] Integration tests passing
- [ ] Performance tests executed and validated
- [ ] Security scan completed (no critical/high vulnerabilities)
- [ ] Documentation updated (API docs, runbooks, README)

**Environment Readiness:**
- [ ] Staging environment mirrors production
- [ ] All dependencies available and versioned
- [ ] Configuration files prepared for production
- [ ] Secrets and credentials rotated if needed
- [ ] Database migrations tested (if applicable)
- [ ] Feature flags configured

**Operational Readiness:**
- [ ] Deployment plan documented and reviewed
- [ ] Rollback plan prepared and tested
- [ ] Monitoring dashboards updated for new metrics
- [ ] Alerts configured for new components
- [ ] On-call engineer assigned and briefed
- [ ] Stakeholders notified (T-24 hours)
- [ ] Change request approved (CAB if required)

**Backup and Recovery:**
- [ ] Current production state backed up
- [ ] Backup verified and tested
- [ ] Recovery procedures documented
- [ ] RTO/RPO requirements confirmed

#### 4.1.2 Deployment Strategies

**Strategy 1: Blue-Green Deployment (Recommended for Model Updates)**

```bash
# 1. Deploy new version to "green" environment
kubectl apply -f k8s/deployment-green.yaml

# 2. Wait for green to be healthy
kubectl wait --for=condition=ready pod \
  -l app=ml-api,version=green \
  -n ai-production \
  --timeout=300s

# 3. Run smoke tests on green
python scripts/smoke_test.py --target green --comprehensive

# 4. Switch traffic from blue to green (gradual)
# Start with 10% traffic to green
kubectl patch service ml-api -n ai-production -p '
{
  "spec": {
    "selector": {
      "app": "ml-api",
      "version": "green"
    }
  }
}'

# 5. Monitor for 10 minutes
python scripts/monitor_deployment.py --duration 600 --threshold strict

# 6. If successful, full cutover
# Update ingress or service mesh rules for 100% traffic

# 7. Keep blue running for 1 hour (quick rollback if needed)
# After 1 hour, scale down blue
kubectl scale deployment/ml-api-blue --replicas=0 -n ai-production
```

**Strategy 2: Canary Deployment (Recommended for API Changes)**

```bash
# 1. Deploy canary version (10% of pods)
kubectl apply -f k8s/deployment-canary.yaml
# Canary deployment has 1 replica vs 9 stable replicas

# 2. Configure traffic split (10% to canary)
kubectl apply -f k8s/destinationrule-canary.yaml

# 3. Monitor canary metrics for 30 minutes
python scripts/monitor_canary.py \
  --duration 1800 \
  --metrics "error_rate,latency,accuracy" \
  --compare-baseline

# 4. Analysis
# If canary metrics within 5% of stable: Proceed
# If canary shows issues: Rollback immediately

# 5. Gradual rollout: 10% → 25% → 50% → 100%
for percentage in 25 50 100; do
  kubectl patch virtualservice ml-api -n ai-production --type=merge -p "
  spec:
    http:
    - route:
      - destination:
          host: ml-api-canary
        weight: $percentage
      - destination:
          host: ml-api-stable
        weight: $((100-percentage))
  "
  echo "Traffic at $percentage% to canary. Monitoring..."
  sleep 900  # 15 minutes between stages
  python scripts/check_metrics.py --quick
done

# 6. Full cutover
kubectl set image deployment/ml-api-stable \
  ml-api=company/ml-api:v3.0.0 \
  -n ai-production
kubectl delete deployment ml-api-canary -n ai-production
```

**Strategy 3: Rolling Update (Recommended for Minor Changes)**

```bash
# 1. Configure rolling update parameters
kubectl patch deployment ml-api -n ai-production -p '
{
  "spec": {
    "strategy": {
      "type": "RollingUpdate",
      "rollingUpdate": {
        "maxSurge": 1,
        "maxUnavailable": 0
      }
    }
  }
}'

# 2. Deploy new version
kubectl set image deployment/ml-api \
  ml-api=company/ml-api:v2.4.5 \
  -n ai-production

# 3. Watch rollout progress
kubectl rollout status deployment/ml-api -n ai-production --timeout=10m

# 4. Monitor during rollout
watch -n 5 'kubectl get pods -n ai-production -l app=ml-api'

# 5. Verify success
kubectl rollout history deployment/ml-api -n ai-production
```

#### 4.1.3 Deployment Execution Example

**Full Production Deployment:**

```bash
#!/bin/bash
# deploy_to_production.sh

set -e  # Exit on error

# Configuration
VERSION="v3.0.0"
ENVIRONMENT="production"
NAMESPACE="ai-production"
STRATEGY="blue-green"

echo "=== Starting Production Deployment ==="
echo "Version: $VERSION"
echo "Time: $(date)"

# 1. Pre-deployment checks
echo "Running pre-deployment checks..."
python scripts/pre_deployment_check.py --environment $ENVIRONMENT
if [ $? -ne 0 ]; then
  echo "Pre-deployment checks failed. Aborting."
  exit 1
fi

# 2. Backup current state
echo "Backing up current production state..."
python scripts/backup_production.py --tag "pre_deploy_$VERSION"

# 3. Create deployment marker
kubectl annotate deployment/ml-api \
  deployment.kubernetes.io/revision="$VERSION" \
  deployment.kubernetes.io/deployed-by="$(whoami)" \
  deployment.kubernetes.io/deployed-at="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -n $NAMESPACE

# 4. Deploy
echo "Deploying version $VERSION..."
case $STRATEGY in
  "blue-green")
    ./scripts/deploy_blue_green.sh --version $VERSION --namespace $NAMESPACE
    ;;
  "canary")
    ./scripts/deploy_canary.sh --version $VERSION --namespace $NAMESPACE
    ;;
  "rolling")
    kubectl set image deployment/ml-api ml-api=company/ml-api:$VERSION -n $NAMESPACE
    kubectl rollout status deployment/ml-api -n $NAMESPACE --timeout=10m
    ;;
esac

# 5. Post-deployment verification
echo "Running post-deployment verification..."
sleep 30  # Allow metrics to stabilize

python scripts/smoke_test.py --environment $ENVIRONMENT --comprehensive
if [ $? -ne 0 ]; then
  echo "Smoke tests failed. Initiating rollback."
  ./scripts/rollback.sh --immediate
  exit 1
fi

# 6. Health check
python scripts/health_check.py --environment $ENVIRONMENT --strict
if [ $? -ne 0 ]; then
  echo "Health check failed. Initiating rollback."
  ./scripts/rollback.sh --immediate
  exit 1
fi

# 7. Monitor for 15 minutes
echo "Monitoring deployment for 15 minutes..."
python scripts/monitor_deployment.py --duration 900 --alert-on-anomaly
if [ $? -ne 0 ]; then
  echo "Anomalies detected. Initiating rollback."
  ./scripts/rollback.sh --immediate
  exit 1
fi

# 8. Success
echo "=== Deployment Successful ==="
echo "Version $VERSION is now live in production"
echo "Deployment completed at: $(date)"

# 9. Send notifications
python scripts/notify_deployment.py \
  --version $VERSION \
  --status success \
  --environment $ENVIRONMENT

# 10. Update documentation
git tag "production-$VERSION-$(date +%Y%m%d)"
git push origin --tags

echo "Deployment complete. Monitoring continues..."
```

### 4.2 Rollback Procedures

#### 4.2.1 When to Rollback

**Immediate Rollback Triggers:**
- Error rate >2% after deployment
- Latency increase >50% from baseline
- Critical functionality broken
- Data corruption detected
- Security vulnerability introduced
- Compliance violation
- High severity bugs affecting >10% of users

**Rollback Decision Framework:**
```
If (error_rate > 2% OR latency_p95 > 1.5 * baseline OR critical_bug):
    Initiate immediate rollback
Else If (minor_issues AND fix_available_within_1h):
    Attempt hot-fix
Else:
    Rollback and fix properly
```

#### 4.2.2 Rollback Execution

**Quick Rollback (Kubernetes):**

```bash
# Method 1: Rollback to previous revision
kubectl rollout undo deployment/ml-api -n ai-production

# Method 2: Rollback to specific revision
kubectl rollout history deployment/ml-api -n ai-production
kubectl rollout undo deployment/ml-api --to-revision=5 -n ai-production

# Method 3: Blue-Green switch back
kubectl patch service ml-api -n ai-production -p '
{
  "spec": {
    "selector": {
      "app": "ml-api",
      "version": "blue"
    }
  }
}'

# Verify rollback
kubectl rollout status deployment/ml-api -n ai-production
python scripts/verify_rollback.py --check-metrics
```

**Model Rollback:**

```bash
# Rollback to previous model version
python scripts/rollback_model.py \
  --environment production \
  --to-version v2.3.2 \
  --reason "accuracy_drop"

# Verify model switch
curl -X POST https://api.company.com/v1/predict \
  -H "Content-Type: application/json" \
  -d '{"features": [1.0, 2.0, 3.0]}' | jq '.model_version'

# Should return: "v2.3.2"
```

**Data Pipeline Rollback:**

```bash
# Rollback to previous pipeline version
git checkout tags/pipeline-v2.1.0
cd airflow/dags
cp * /opt/airflow/dags/

# Restart Airflow components
kubectl rollout restart deployment/airflow-scheduler -n ai-production
kubectl rollout restart deployment/airflow-webserver -n ai-production

# Verify pipeline version
airflow dags show feature_pipeline | grep version
```

#### 4.2.3 Post-Rollback Actions

```bash
# 1. Verify system stability
python scripts/post_rollback_check.py --comprehensive

# 2. Document rollback
vim /ops/rollback-logs/$(date +%Y%m%d_%H%M).md
# Include: reason, actions taken, impact, resolution time

# 3. Notify stakeholders
python scripts/notify_rollback.py \
  --reason "deployment_issues" \
  --impact "minimal" \
  --resolution-time "15m"

# 4. Create incident report
python scripts/create_incident.py \
  --type rollback \
  --severity P2 \
  --summary "Deployment v3.0.0 rolled back due to high error rate"

# 5. Schedule post-mortem
# Review what went wrong and how to prevent future occurrences
```

### 4.3 Version Control

#### 4.3.1 Versioning Strategy

**Semantic Versioning (SemVer):**
- Format: `MAJOR.MINOR.PATCH` (e.g., v2.3.1)
- **MAJOR:** Breaking changes, incompatible API changes
- **MINOR:** New features, backward compatible
- **PATCH:** Bug fixes, backward compatible

**Model Versioning:**
- Format: `vMAJOR.MINOR.PATCH-MMDDYYYY` (e.g., v3.0.1-02112026)
- Includes training date for traceability

**Git Tagging:**
```bash
# Tag release
git tag -a v2.3.1 -m "Release v2.3.1: Bug fixes and performance improvements"
git push origin v2.3.1

# Tag production deployment
git tag -a production-v2.3.1-20260211 -m "Deployed to production on 2026-02-11"
git push origin --tags
```

#### 4.3.2 Artifact Management

**Docker Images:**
```bash
# Build and tag
docker build -t company/ml-api:v2.3.1 .
docker tag company/ml-api:v2.3.1 company/ml-api:latest
docker tag company/ml-api:v2.3.1 company/ml-api:stable

# Push to registry
docker push company/ml-api:v2.3.1
docker push company/ml-api:latest

# Verify
docker pull company/ml-api:v2.3.1
docker inspect company/ml-api:v2.3.1 | jq '.[0].Config.Labels'
```

**Model Artifacts:**
```bash
# Register model in MLflow
mlflow models serve \
  --model-uri models:/customer-churn/v3.0.1 \
  --port 5000 \
  --env-manager conda

# Version and tag
mlflow models create-version \
  --name customer-churn \
  --source s3://models/customer-churn/v3.0.1 \
  --run-id abc123def456

# Promote to production
mlflow models transition-version-stage \
  --name customer-churn \
  --version 10 \
  --stage Production
```

---

## 5. Troubleshooting Guide

### 5.1 Common Issues

#### Issue 1: High API Latency

**Symptoms:**
- Response time p95 >500ms
- Slow user experience
- Timeout errors

**Diagnostic Steps:**
```bash
# 1. Check current latency
curl -w "@curl-format.txt" -o /dev/null -s https://api.company.com/v1/predict

# 2. Check resource utilization
kubectl top pods -n ai-production -l app=ml-api

# 3. Profile API endpoint
python scripts/profile_api.py --endpoint /v1/predict --samples 100

# 4. Check database performance
psql -h prod-db -U readonly -d mldb -c "
  SELECT query, mean_exec_time, calls 
  FROM pg_stat_statements 
  ORDER BY mean_exec_time DESC 
  LIMIT 10;
"

# 5. Check external dependencies
python scripts/check_external_deps.py --measure-latency
```

**Common Causes & Solutions:**

| Cause | Solution |
|-------|----------|
| Resource constraints | Scale up pods or increase resources |
| Slow database queries | Optimize queries, add indexes |
| External API delays | Implement caching, use async calls |
| Large model inference time | Optimize model, use batching |
| Network issues | Check service mesh, review routing |

**Resolution Steps:**
```bash
# If resource constrained
kubectl scale deployment/ml-api --replicas=12 -n ai-production
kubectl set resources deployment/ml-api \
  --limits=cpu=8,memory=16Gi \
  -n ai-production

# If database slow
psql -h prod-db -U admin -d mldb <<EOF
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_features_user_id 
ON features(user_id, timestamp DESC);
ANALYZE features;
EOF

# If external dependency slow
kubectl set env deployment/ml-api \
  ENABLE_CACHE=true \
  CACHE_TTL=300 \
  -n ai-production
```

#### Issue 2: Model Prediction Errors

**Symptoms:**
- Prediction accuracy drop
- Unexpected null/error responses
- Feature missing errors

**Diagnostic Steps:**
```bash
# 1. Check model health
python scripts/model_health_check.py --environment prod

# 2. Validate input data
python scripts/validate_prediction_inputs.py --sample recent --count 100

# 3. Check feature availability
python scripts/check_feature_store.py --features all --freshness

# 4. Compare predictions with baseline
python scripts/compare_predictions.py \
  --current prod \
  --baseline v2.3.2 \
  --samples 1000

# 5. Review model metrics
curl -s http://ml-api.ai-production:9090/metrics | grep model_
```

**Common Causes & Solutions:**

| Cause | Solution |
|-------|----------|
| Data drift | Retrain model with recent data |
| Missing features | Fix feature pipeline, backfill data |
| Model bug | Rollback to previous version |
| Schema mismatch | Update data validation schema |
| Resource exhaustion | Increase model serving resources |

**Resolution Steps:**
```bash
# If data drift detected
python scripts/trigger_model_retraining.py \
  --reason data_drift \
  --priority high \
  --notify team

# If missing features
airflow dags backfill feature_pipeline \
  --start-date 2026-02-10 \
  --end-date 2026-02-11 \
  --reset-dagruns

# If model bug
python scripts/rollback_model.py \
  --to-version v2.3.2 \
  --environment production \
  --immediate
```

#### Issue 3: Data Pipeline Failures

**Symptoms:**
- Airflow DAG failed status
- Stale features in feature store
- Data quality alerts

**Diagnostic Steps:**
```bash
# 1. Check DAG status
airflow dags list-runs --dag-id feature_pipeline --state failed

# 2. View task logs
airflow tasks logs feature_pipeline extract_data $(date +%Y-%m-%d)

# 3. Check data source availability
curl -I https://data-source-api.com/v1/data

# 4. Validate data quality
python scripts/data_quality_check.py --date today --detailed

# 5. Check Spark job status (if applicable)
spark-submit --status driver-20260211-123456-0001
```

**Common Causes & Solutions:**

| Cause | Solution |
|-------|----------|
| Source API down | Switch to backup source, wait for recovery |
| Data schema change | Update pipeline code, adjust schema |
| Resource limits | Increase Spark/Airflow resources |
| Network issues | Check connectivity, review firewall rules |
| Bad data | Add data validation, fix upstream |

**Resolution Steps:**
```bash
# If source unavailable - use backup
airflow variables set DATA_SOURCE backup_api
airflow dags trigger feature_pipeline --exec-date $(date +%Y-%m-%d)

# If schema mismatch - update and retry
git pull origin main  # Get latest pipeline code with schema fix
airflow dags trigger feature_pipeline --exec-date $(date +%Y-%m-%d)

# If resource issues
kubectl set resources deployment/airflow-worker \
  --limits=cpu=8,memory=32Gi \
  -n ai-production

# Rerun failed tasks
airflow tasks clear feature_pipeline \
  --task-regex "failed_task.*" \
  --yes \
  --dag-run-state failed
```

### 5.2 Diagnostic Steps

#### Comprehensive System Diagnostic

```bash
#!/bin/bash
# comprehensive_diagnostic.sh
# Run this script when troubleshooting complex issues

echo "=== Starting Comprehensive Diagnostic ==="
echo "Time: $(date)"

# 1. System Status
echo -e "\n=== SYSTEM STATUS ==="
kubectl get nodes
kubectl get pods -n ai-production
kubectl top nodes
kubectl top pods -n ai-production

# 2. Recent Events
echo -e "\n=== RECENT EVENTS ==="
kubectl get events -n ai-production --sort-by='.lastTimestamp' | tail -20

# 3. Application Health
echo -e "\n=== APPLICATION HEALTH ==="
for pod in $(kubectl get pods -n ai-production -l app=ml-api -o name); do
  echo "Checking $pod..."
  kubectl exec $pod -n ai-production -- curl -s http://localhost:8080/health | jq
done

# 4. Log Analysis
echo -e "\n=== ERROR LOG ANALYSIS ==="
kubectl logs -n ai-production -l app=ml-api --tail=500 --since=1h | \
  grep -i error | \
  sort | uniq -c | sort -rn | head -10

# 5. Metrics Check
echo -e "\n=== METRICS CHECK ==="
echo "API Error Rate (last 5m):"
curl -s "http://prometheus:9090/api/v1/query?query=rate(http_requests_total{status=~\"5..\"}[5m])" | jq

echo "API Latency p95 (last 5m):"
curl -s "http://prometheus:9090/api/v1/query?query=histogram_quantile(0.95,rate(http_request_duration_seconds_bucket[5m]))" | jq

# 6. Database Health
echo -e "\n=== DATABASE HEALTH ==="
psql -h prod-db -U readonly -d mldb -c "
  SELECT 
    datname,
    numbackends as connections,
    xact_commit as commits,
    xact_rollback as rollbacks,
    blks_read,
    blks_hit,
    tup_returned,
    tup_fetched
  FROM pg_stat_database 
  WHERE datname = 'mldb';
"

# 7. External Dependencies
echo -e "\n=== EXTERNAL DEPENDENCIES ==="
python scripts/check_external_dependencies.py --verbose

# 8. Model Performance
echo -e "\n=== MODEL PERFORMANCE ==="
python scripts/model_metrics_summary.py --period 1h

# 9. Recent Changes
echo -e "\n=== RECENT DEPLOYMENTS ==="
kubectl rollout history deployment/ml-api -n ai-production | tail -5

# 10. Resource Recommendations
echo -e "\n=== RESOURCE RECOMMENDATIONS ==="
python scripts/resource_recommendations.py --based-on-metrics

echo -e "\n=== Diagnostic Complete ==="
echo "Results saved to: /tmp/diagnostic_$(date +%Y%m%d_%H%M%S).log"
```

### 5.3 Resolution Procedures

#### Quick Reference Decision Tree

```
Problem Detected
       |
       v
Is service down?
    |     |
   Yes    No
    |     |
    v     v
  P0   Is performance degraded?
        |     |
       Yes    No
        |     |
        v     v
       P1   Is data stale?
              |     |
             Yes    No
              |     |
              v     v
             P2   Monitor
```

#### Standard Resolution Workflow

```bash
# 1. Identify
python scripts/identify_issue.py --auto-detect

# 2. Isolate
python scripts/isolate_component.py --issue-id <id>

# 3. Mitigate
python scripts/apply_mitigation.py --strategy <strategy>

# 4. Resolve
# Execute specific fix based on root cause

# 5. Verify
python scripts/verify_resolution.py --comprehensive

# 6. Document
python scripts/document_incident.py --issue-id <id>
```

---

## 6. Performance Optimization

### 6.1 Performance Monitoring

**Key Performance Indicators:**

| Metric | Target | Current | Trend |
|--------|--------|---------|-------|
| API Latency (p50) | <100ms | 85ms | ↓ Good |
| API Latency (p95) | <500ms | 420ms | → Stable |
| API Latency (p99) | <1000ms | 890ms | → Stable |
| Throughput | >100 req/s | 145 req/s | ↑ Good |
| Model Inference Time | <200ms | 165ms | ↓ Good |
| Data Pipeline Duration | <30min | 25min | ↓ Good |
| Feature Retrieval Time | <50ms | 38ms | → Stable |

**Performance Profiling:**

```bash
# Profile API endpoints
python scripts/profile_endpoints.py \
  --duration 3600 \
  --output /reports/performance_profile.html

# Profile model inference
python scripts/profile_model_inference.py \
  --model customer-churn \
  --samples 10000 \
  --output /reports/model_profile.json

# Database query profiling
psql -h prod-db -U readonly -d mldb -c "
  SELECT 
    query,
    calls,
    total_exec_time,
    mean_exec_time,
    max_exec_time
  FROM pg_stat_statements
  WHERE mean_exec_time > 100  -- queries slower than 100ms
  ORDER BY mean_exec_time DESC
  LIMIT 20;
"
```

### 6.2 Optimization Techniques

#### API Optimization

```python
# Example: Implement caching
from functools import lru_cache
from redis import Redis

redis_client = Redis(host='redis-cache', port=6379)

@lru_cache(maxsize=10000)
def get_user_features(user_id: str):
    """Cache user features in memory"""
    # Check Redis first
    cached = redis_client.get(f"features:{user_id}")
    if cached:
        return json.loads(cached)
    
    # Fetch from feature store
    features = feature_store.get_features(user_id)
    
    # Cache for 5 minutes
    redis_client.setex(
        f"features:{user_id}",
        300,
        json.dumps(features)
    )
    return features

# Example: Batch prediction requests
async def batch_predict(requests: List[PredictionRequest]):
    """Process predictions in batches for efficiency"""
    batch_size = 32
    results = []
    
    for i in range(0, len(requests), batch_size):
        batch = requests[i:i+batch_size]
        batch_features = [r.features for r in batch]
        
        # Single model inference for batch
        predictions = model.predict_batch(batch_features)
        results.extend(predictions)
    
    return results
```

#### Model Optimization

```bash
# Convert model to ONNX for faster inference
python scripts/convert_to_onnx.py \
  --model models/customer-churn-v3.pkl \
  --output models/customer-churn-v3.onnx \
  --optimize

# Quantize model to reduce size and improve speed
python scripts/quantize_model.py \
  --model models/customer-churn-v3.onnx \
  --strategy dynamic \
  --output models/customer-churn-v3-quantized.onnx

# Benchmark optimization
python scripts/benchmark_model.py \
  --original models/customer-churn-v3.pkl \
  --optimized models/customer-churn-v3-quantized.onnx \
  --samples 10000

# Expected results:
# Original: 180ms average inference
# Optimized: 95ms average inference (~47% improvement)
```

#### Database Optimization

```sql
-- Create indexes for common queries
CREATE INDEX CONCURRENTLY idx_predictions_user_timestamp 
ON predictions(user_id, timestamp DESC);

CREATE INDEX CONCURRENTLY idx_features_created_at 
ON features(created_at) 
WHERE created_at > NOW() - INTERVAL '7 days';

-- Partition large tables
CREATE TABLE predictions_2026_02 PARTITION OF predictions
FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');

-- Update statistics
ANALYZE VERBOSE;

-- Check index usage
SELECT 
  schemaname,
  tablename,
  indexname,
  idx_scan,
  idx_tup_read,
  idx_tup_fetch
FROM pg_stat_user_indexes
WHERE idx_scan < 100  -- Unused indexes
ORDER BY idx_scan;
```

---

## 7. Security Operations

### 7.1 Access Control

#### Role-Based Access Control (RBAC)

**Roles:**

| Role | Permissions | Access Level |
|------|-------------|--------------|
| Admin | Full access to all systems | Read/Write/Delete |
| SRE | Operations, monitoring, deployment | Read/Write |
| ML Engineer | Model deployment, monitoring | Read/Write (models only) |
| Developer | Read logs, metrics | Read only |
| Auditor | View logs, configurations | Read only |

**Kubernetes RBAC Configuration:**

```yaml
# rbac-sre-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: sre-role
  namespace: ai-production
rules:
- apiGroups: ["apps", ""]
  resources: ["deployments", "pods", "services"]
  verbs: ["get", "list", "watch", "update", "patch"]
- apiGroups: [""]
  resources: ["pods/log"]
  verbs: ["get", "list"]
- apiGroups: ["batch"]
  resources: ["jobs", "cronjobs"]
  verbs: ["get", "list", "create", "delete"]
```

#### Access Management

```bash
# Grant access
kubectl create rolebinding sre-john \
  --role=sre-role \
  --user=john@company.com \
  --namespace=ai-production

# Revoke access
kubectl delete rolebinding sre-john -n ai-production

# Audit access
kubectl get rolebindings -n ai-production
kubectl auth can-i --list --as=john@company.com -n ai-production
```

### 7.2 Security Monitoring

#### Security Checks

```bash
# Daily security scan
trivy image company/ml-api:v3.0.0

# Check for secrets in logs
kubectl logs -n ai-production -l app=ml-api --since=24h | \
  grep -iE '(password|api[_-]key|secret|token)' | wc -l
# Should be 0

# Review recent authentication attempts
psql -h prod-db -U security -d mldb -c "
  SELECT 
    timestamp,
    user_id,
    action,
    result,
    ip_address
  FROM audit_log
  WHERE timestamp > NOW() - INTERVAL '24 hours'
    AND action = 'authentication'
    AND result = 'failed'
  ORDER BY timestamp DESC
  LIMIT 100;
"

# Check certificate expiration
echo | openssl s_client -servername api.company.com \
  -connect api.company.com:443 2>/dev/null | \
  openssl x509 -noout -dates
```

#### Security Alerts

```yaml
# Security alert rules
groups:
- name: security_alerts
  rules:
  - alert: UnauthorizedAccessAttempt
    expr: |
      sum(rate(http_requests_total{status="401"}[5m])) > 10
    labels:
      severity: warning
      team: security
    annotations:
      summary: "High rate of unauthorized access attempts"
      
  - alert: SuspiciousActivity
    expr: |
      rate(api_requests_total{endpoint="/admin"}[5m]) > 1
      and
      hour() >= 22 or hour() <= 6
    labels:
      severity: critical
      team: security
    annotations:
      summary: "Admin endpoint accessed during off-hours"
```

### 7.3 Incident Response

**Security Incident Response Plan:**

```bash
# 1. Detect and Contain
kubectl scale deployment/ml-api --replicas=0 -n ai-production  # Stop service if needed

# 2. Investigate
kubectl logs -n ai-production -l app=ml-api --since=2h > /tmp/security-logs.txt
python scripts/analyze_security_incident.py --logs /tmp/security-logs.txt

# 3. Remediate
python scripts/rotate_credentials.py --all --emergency
kubectl delete secret api-keys -n ai-production
kubectl create secret generic api-keys --from-file=./new-keys.json -n ai-production

# 4. Recover
kubectl scale deployment/ml-api --replicas=10 -n ai-production

# 5. Review
python scripts/security_postmortem.py --incident-id SEC-2026-001
```

---

## 8. Backup and Recovery

### 8.1 Backup Procedures

**Backup Schedule:**

| Component | Frequency | Retention | Location |
|-----------|-----------|-----------|----------|
| Database | Hourly + Daily | 7 days + 90 days | S3 encrypted |
| Model Artifacts | On deployment | Forever | S3 Glacier |
| Configuration | On change | 30 days | Git + S3 |
| Logs | Continuous | 30 days | Elasticsearch |
| Metrics | Continuous | 15 days (raw), 365 days (aggregated) | Prometheus |

**Backup Execution:**

```bash
# Database backup
pg_dump -h prod-db -U backup -d mldb -F c \
  -f /backups/mldb_$(date +%Y%m%d_%H%M%S).dump

# Upload to S3
aws s3 cp /backups/mldb_*.dump \
  s3://backups/database/$(date +%Y-%m-%d)/ \
  --storage-class STANDARD_IA \
  --server-side-encryption AES256

# Verify backup
python scripts/verify_backup.py \
  --file /backups/mldb_$(date +%Y%m%d_%H%M%S).dump \
  --checksum
```

### 8.2 Recovery Procedures

**Database Recovery:**

```bash
# Restore from backup
pg_restore -h prod-db -U admin -d mldb \
  --clean \
  --if-exists \
  /backups/mldb_20260211_020000.dump

# Verify data
psql -h prod-db -U readonly -d mldb -c "
  SELECT COUNT(*) FROM predictions WHERE date = '2026-02-11';
"
```

**Disaster Recovery:**

```bash
# Full system recovery
python scripts/disaster_recovery.py \
  --restore-point 2026-02-11T02:00:00Z \
  --components all \
  --verify

# Expected RTO: 4 hours
# Expected RPO: 1 hour
```

---

## 9. Contact Information and Escalation

**Team Contacts:**

| Role | Name | Email | Phone | Coverage |
|------|------|-------|-------|----------|
| Primary On-Call | Rotation | oncall@company.com | +1-XXX-XXX-XXXX | 24/7 |
| Secondary On-Call | Rotation | oncall-backup@company.com | +1-XXX-XXX-XXXX | 24/7 |
| Engineering Manager | [Name] | manager@company.com | +1-XXX-XXX-XXXX | Business hours |
| VP Engineering | [Name] | vp@company.com | +1-XXX-XXX-XXXX | Escalation only |

**External Contacts:**

| Vendor | Purpose | Contact | SLA |
|--------|---------|---------|-----|
| AWS Support | Cloud infrastructure | Premium Support | 15 min response |
| DataDog | Monitoring platform | support@datadog.com | 1 hour response |
| ML Platform Vendor | Model serving | support@vendor.com | 4 hour response |

**Emergency Procedures:**
```
1. Page on-call: PagerDuty app or call +1-XXX-XXX-XXXX
2. Join incident bridge: zoom.us/j/XXXXXXXXXX
3. Update status page: status.company.com
4. Post in #incidents channel
```

---

## 10. Documentation and Change Management

### 10.1 Documentation Standards

**Required Documentation:**
- Architecture Decision Records (ADRs)
- Deployment procedures
- Troubleshooting guides
- Configuration changes
- Incident post-mortems

**Documentation Locations:**
- Wiki: https://wiki.company.com/ai-ops
- Code repo: /docs directory
- Runbooks: /runbooks directory
- Status: https://status.company.com

### 10.2 Change Management

**Change Request Process:**

```bash
# Submit change request
python scripts/submit_change_request.py \
  --title "Upgrade ML API to v3.0.0" \
  --type deployment \
  --risk medium \
  --impact "API will be unavailable for 2 minutes" \
  --rollback-plan "kubectl rollout undo"

# Change approval required for:
# - Production deployments
# - Configuration changes
# - Infrastructure modifications
# - Security updates
```

**Change Calendar:**
https://calendar.company.com/changes

**Freeze Periods:**
- End of quarter: Last week
- Major holidays
- Peak business periods

---

## Appendices

### Appendix A: Command Reference

```bash
# Kubernetes
kubectl get pods -n ai-production
kubectl logs -f <pod-name> -n ai-production
kubectl exec -it <pod-name> -n ai-production -- /bin/bash
kubectl top pods -n ai-production

# Airflow
airflow dags list
airflow dags trigger <dag-id>
airflow tasks logs <dag-id> <task-id> <execution-date>

# Database
psql -h <host> -U <user> -d <database>

# Model Management
mlflow models serve --model-uri <uri>
python scripts/switch_model.py --version <version>
```

### Appendix B: Useful Scripts

All operational scripts located in:
`/opt/ai-ops/scripts/`

Key scripts:
- `health_check.py`
- `deploy_model.py`
- `backup_production.py`
- `rollback_deployment.sh`
- `monitor_metrics.py`

### Appendix C: Glossary

- **DAG:** Directed Acyclic Graph (Airflow workflow)
- **Feature Store:** Centralized repository for ML features
- **MLOps:** Machine Learning Operations
- **P95/P99:** 95th/99th percentile response time
- **Runbook:** Operational procedure documentation
- **SLA:** Service Level Agreement
- **SRE:** Site Reliability Engineer

### Appendix D: Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-12-01 | Ops Team | Initial version |
| 2.0 | 2026-01-15 | Ops Team | Added model deployment procedures |
| 2.1 | 2026-02-11 | Ops Team | Updated security procedures |

---

**END OF RUNBOOK**

**Last Updated:** February 11, 2026  
**Next Review:** May 11, 2026  
**Maintained By:** AI Operations Team
